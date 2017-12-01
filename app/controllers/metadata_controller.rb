class MetadataController < ApplicationController
  def index
    tempMetadata = [
      {
        category: "Category 1",
        resource: "Resource 1",
        version: "V1",
        contact_organistion: "Contact Organisation 1",
        id: 0,
        metadata: 'http://google.com',
        factsheet: 'http://bbc.com',
        marine_spatial_planning: true,
        education: false,
        environmental_impact_assessment: false,
        ecosystem_assessment: false,
        ecosystem_services: true
      },
      {
        category: "Category 2",
        resource: "Resource 2",
        version: "V2",
        contact_organistion: "Contact Organisation 1",
        id: 1,
        metadata: 'http://smashingmagazine.com',
        factsheet: 'http://html5rocks.com',
        marine_spatial_planning: true,
        education: true,
        environmental_impact_assessment: true,
        ecosystem_assessment: true,
        ecosystem_services: true
      },
      {
        category: "Category 3",
        resource: "Resource 3",
        version: "V1",
        contact_organistion: "Contact Organisation 3",
        id: 2,
        metadata: 'http://protectedplanet.net',
        factsheet: 'http://unep-wcmc.org',
        marine_spatial_planning: false,
        education: false,
        environmental_impact_assessment: false,
        ecosystem_assessment: false,
        ecosystem_services: true
      }
    ]

    tempFilters = [   
      {
        name: "category",
        title: "Category",
        options: ["Category 1", "Category 2", "Category 3"]
      },
      {
        title: "Resource"
      },
      {
        title: "Version"
      },
      {
        title: "Contact Organistion"
      },
      {
        title: "ID"
      },
      {   
        name: "metadata",
        title: "Metadata",
        options: ["Metadata", "No Metadata"]
      },
      {   
        name: "factsheet",
        title: "Factsheet",
        options: ["Factsheet", "No Factsheet"]
      },
      {   
        name: "themes",
        title: "Themes",
        options: ["Marine spatial planning", "Education", "Ecosystem assessment", "Environmental impact assessment", "Ecosystem services"]
      },
    ]
   
    @filters = tempFilters.to_json    
    @metadata = tempMetadata.to_json
  end
end