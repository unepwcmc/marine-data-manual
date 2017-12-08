class Metadata < ApplicationRecord

  def self.filters_to_json
    metadata = Metadata.all
    unique_categories = metadata.pluck(:category).compact.uniq.sort

    filters = [
      {
        name: "category",
        title: "Category",
        options: unique_categories,
        sortButtons: true
      },
      {
        name: "resource",
        title: "Resource",
        sortButtons: true
      },
      {
        name: "version",
        title: "Version",
        sortButtons: true
      },
      {
        name: "contact_organisation",
        title: "Contact Organisation",
        sortButtons: true
      },
      {
        name: "id",
        title: "ID",
        sortButtons: true
      },
      {
        name: "metadata",
        title: "Metadata",
        options: ["Metadata", "No Metadata"],
        sortButtons: false,
        type: "boolean"
      },
      {
        name: "factsheet",
        title: "Factsheet",
        options: ["Factsheet", "No Factsheet"],
        sortButtons: false,
        type: "boolean"
      },
      {
        name: "themes",
        title: "Themes",
        options: ["Marine spatial planning", "Education", "Ecosystem assessment", "Environmental impact assessment", "Ecosystem services"],
        sortButtons: false
      },
    ].to_json
  end

  def self.metadata_to_json
    Metadata.all.order(id: :asc).to_json
  end

  def self.to_csv
    csv = ''
    metadata_columns = Metadata.new.attributes.keys
    metadata_columns.delete("created_at")
    metadata_columns.delete("updated_at")

    metadata_columns.map! { |e|
      e.gsub("_", " ").capitalize
    }

    csv << metadata_columns.join(',')
    csv << "\r\n"

    metadata = Metadata.order(id: :asc)

    metadata.to_a.each do |meta|
      metadata_attributes = meta.attributes
      metadata_attributes.delete("created_at")
      metadata_attributes.delete("updated_at")

      metadata_attributes = metadata_attributes.values.map{ |e| "\"#{e}\"" }
      csv << metadata_attributes.join(',').to_s
      csv << "\r\n"
    end

    csv

  end

end
