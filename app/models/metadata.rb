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
    output = []
    metadata = Metadata.all.order(id: :asc)
    metadata.to_a.each do |meta|
      meta_attributes = meta.attributes
      meta_attributes[:themes] = []
      meta_attributes[:themes] << "marine_spatial_planning" if meta_attributes["marine_spatial_planning"]
      meta_attributes[:themes] << "education" if meta_attributes["education"]
      meta_attributes[:themes] << "environmental_impact_assessment" if meta_attributes["environmental_impact_assessment"]
      meta_attributes[:themes] << "ecosystem_assessment" if meta_attributes["ecosystem_assessment"]
      meta_attributes[:themes] << "ecosystem_services" if meta_attributes["ecosystem_services"]
      meta_attributes.delete("created_at")
      meta_attributes.delete("updated_at")
      meta_attributes.delete("marine_spatial_planning")
      meta_attributes.delete("education")
      meta_attributes.delete("environmental_impact_assessment")
      meta_attributes.delete("ecosystem_assessment")
      meta_attributes.delete("ecosystem_services")
      output << meta_attributes
    end
    output.to_json
  end

end
