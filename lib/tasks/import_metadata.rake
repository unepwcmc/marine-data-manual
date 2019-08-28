require 'csv'

namespace :import do
  # usage bundle exec rake import:metadata[path/to/file,global]
  # global import only global metadata, regional import regional metadata
  desc "import CSV data into database"
  task :metadata, [:csv_file, :meta_type] => [:environment] do |_t, args|

    import_csv_file(args.csv_file, args.meta_type)

  end

  def import_csv_file(file, meta_type)

    method = "#{meta_type}_metadata"
    Metadata.send(method).destroy_all

    csv = File.open(file, encoding: "utf-8")

    csv_headers = File.readlines(csv).first.split(",")

    metadata_hash = {
      category: csv_headers[0],
      resource: csv_headers[1],
      version: csv_headers[2],
      contact_organisation: csv_headers[3],
      dataset_id: csv_headers[4],
      metadata: csv_headers[5],
      website_download_link: csv_headers[6],
      factsheet: csv_headers[7],
      license_number: csv_headers[10],
      license_url: csv_headers[11],
      open_access: csv_headers[12],
      marine_spatial_planning: csv_headers[13],
      education: csv_headers[14],
      environmental_impact_assessment: csv_headers[15],
      ecosystem_assessment: csv_headers[16],
      ecosystem_services: csv_headers[17],
      pdf_link: csv_headers[18],
      language: csv_headers[19].chomp
    }

    CSV.parse(csv, headers: true, encoding: "utf-8") do |row|
      csv_hash = row.to_hash
      csv_metadata_row = csv_hash.except('Country', 'Region', 'Other access use constraints')
      csv_country_row = csv_hash.delete('Country').split(';')
      csv_region_row = csv_hash.delete('Region').split(';')
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

      begin
        ActiveRecord::Base.transaction do
          meta = Metadata.find_or_create_by(dataset_id: current_dataset_id) do |metadata|
                   metadata.update_attributes(metadata_row_hash)
                 end

          import_location('country', csv_country_row, meta)
          import_location('region', csv_region_row, meta)
        end
      rescue => e
        p e
        raise ActiveRecord::Rollback
      end
    end

    csv.close

    Rails.logger.info "Imported Metadata, total records: #{Metadata.count}"
  end

  def import_location(field, values, metadata)
    klass = field.titleize.constantize
    association = field.pluralize
    values.each do |value|
      value = value.strip
      obj = klass.find_or_create_by(name: value)
      unless metadata.public_send(association).include? obj
        metadata.public_send(association) << obj
      end
    end
  end
end
