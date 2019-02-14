class Metadata < ApplicationRecord
  def self.to_csv
    csv = ''
    metadata_columns = Metadata.new.attributes.keys
    metadata_columns.delete_if { |k| ["created_at", "updated_at"].include? k }

    metadata_columns.map! { |e| e.tr('_', ' ').capitalize }

    csv << metadata_columns.join(',')
    csv << "\n"

    metadata = Metadata.order(id: :asc)

    metadata.to_a.each do |meta|
      metadata_attributes = meta.attributes
      metadata_attributes.delete_if { |k| ["created_at", "updated_at"].include? k }

      metadata_attributes = metadata_attributes.values.map { |e| "\"#{e}\"" }
      csv << metadata_attributes.join(',').to_s
      csv << "\n"
    end

    csv
  end

end
