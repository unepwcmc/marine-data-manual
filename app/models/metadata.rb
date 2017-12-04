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
        name: 'version',
        title: "Version",
        sortButtons: true
      },
      {
        name: 'contact_organisation',
        title: "Contact Organisation",
        sortButtons: true
      },
      {
        name: 'id',
        title: "ID",
        sortButtons: true
      },
      {
        name: "metadata",
        title: "Metadata",
        options: ["Metadata", "No Metadata"],
        sortButtons: false
      },
      {
        name: "factsheet",
        title: "Factsheet",
        options: ["Factsheet", "No Factsheet"],
        sortButtons: false
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

end
