require 'csv'

namespace :import do
  desc "import CSV data into database"
  task :metadata, [:csv_file] => [:environment] do |t, args|

    import_csv_file(args.csv_file)

  end

  def import_csv_file file

    csv = File.open(file, encoding: "iso-8859-3")

    csv_headers = File.readlines(csv).first.split(",")

    metadata_hash = {
      category: csv_headers[0],
      resource: csv_headers[1],
      version: csv_headers[2],
      contact_organisation: csv_headers[3],
      dataset_id: csv_headers[4],
      website_download_link: csv_headers[6],
      metadata: nil,
      factsheet: csv_headers[7],
      marine_spatial_planning: csv_headers[8],
      education: csv_headers[9],
      environmental_impact_assessment: csv_headers[10],
      ecosystem_assessment: csv_headers[11],
      ecosystem_services: csv_headers[12]
    }

    CSV.parse(csv, :headers => true, encoding: "iso-8859-3") do |row|
      metadata_row = row.to_hash
      current_dataset_id = metadata_row[metadata_hash[:dataset_id]]&.strip

      if Metadata.exists?(dataset_id: current_dataset_id)
        metadata = Metadata.find_by(dataset_id: current_dataset_id)
      else
        metadata = Metadata.new
        metadata.dataset_id = current_dataset_id
      end

      metadata.category = metadata_row[metadata_hash[:category]]&.strip || "Empty"
      metadata.resource = metadata_row[metadata_hash[:resource]]&.strip || "Empty"
      metadata.version = metadata_row[metadata_hash[:version]]&.strip || "Empty"
      metadata.contact_organisation = metadata_row[metadata_hash[:contact_organisation]]&.strip || "Empty"
      metadata.website_download_link = metadata_row[metadata_hash[:website_download_link]]&.strip || "Empty"
      metadata.metadata = "Empty"
      metadata.factsheet = metadata_row[metadata_hash[:factsheet]]&.strip || "Empty"
      metadata.marine_spatial_planning = metadata_row[metadata_hash[:marine_spatial_planning]]&.strip || "Empty"
      metadata.education = metadata_row[metadata_hash[:education]]&.strip || "Empty"
      metadata.environmental_impact_assessment = metadata_row[metadata_hash[:environmental_impact_assessment]]&.strip || "Empty"
      metadata.ecosystem_assessment = metadata_row[metadata_hash[:ecosystem_assessment]]&.strip || "Empty"
      metadata.ecosystem_services = metadata_row[metadata_hash[:ecosystem_services]]&.strip || "Empty"

      puts metadata.inspect

      unless metadata.save!
        Rails.logger.info "Cannot import! #{metadata.resource}"
      end

    end

    csv.close

    Rails.logger.info "Imported Metadata, total records: #{Metadata.count}"
  end

end
