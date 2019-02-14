require 'csv'

namespace :import do
  desc "import CSV data into database"
  task :metadata, [:csv_file] => [:environment] do |t, args|

    import_csv_file(args.csv_file)

  end

  def import_csv_file file

    csv = File.open(file, encoding: "utf-8")

    csv_headers = File.readlines(csv).first.split(",")

    metadata_hash = {
      category: csv_headers[0],
      resource: csv_headers[1],
      version: csv_headers[2],
      contact_organisation: csv_headers[3],
      dataset_id: csv_headers[4],
      website_download_link: csv_headers[6],
      metadata: csv_headers[5],
      factsheet: csv_headers[7],
      marine_spatial_planning: csv_headers[8],
      education: csv_headers[9],
      environmental_impact_assessment: csv_headers[10],
      ecosystem_assessment: csv_headers[11],
      ecosystem_services: csv_headers[12], # .chomp,
      license_number: csv_headers[13],
      region: csv_headers[14],
      country: csv_headers[15].chomp
    }

    CSV.parse(csv, headers: true, encoding: "utf-8") do |row|
      csv_metadata_row = row.to_hash
      metadata_row_hash = {}

      metadata_hash.keys.each do |key|
        if key == :metadata
          metadata_row_hash[key] = csv_metadata_row[metadata_hash[key]]&.strip || false
        elsif key == :factsheet
          metadata_row_hash[key] = csv_metadata_row[metadata_hash[key]]&.strip || nil
        else
          metadata_row_hash[key] = csv_metadata_row[metadata_hash[key]]&.strip
        end
      end

      current_dataset_id = csv_metadata_row[metadata_hash[:dataset_id]]

      if Metadata.exists?(dataset_id: current_dataset_id)
        metadata = Metadata.find_by(dataset_id: current_dataset_id)
        unless metadata.update_attributes(metadata_row_hash)
          Rails.logger.info "Cannot update! #{metadata.resource}"
        end
      else
        metadata = Metadata.new(metadata_row_hash)
      end

      unless metadata.save!
        Rails.logger.info "Cannot import! #{metadata.resource}"
      end

    end

    csv.close

    Rails.logger.info "Imported Metadata, total records: #{Metadata.count}"
  end

end
