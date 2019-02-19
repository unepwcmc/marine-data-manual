class MetadataSerializer
  def initialize(metadata)
    @metadata = metadata
  end

  def filters_to_json
    unique_categories = @metadata.pluck(:category).compact.uniq.sort
    unique_country = @metadata.pluck(:country).compact.uniq.sort
    unique_region = @metadata.pluck(:region).compact.uniq.sort
    unique_license = @metadata.pluck(:license_number).compact.uniq.sort

    [
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
        options: [true, false],
        sortButtons: false,
        type: "boolean"
      },
      {
        name: "factsheet",
        title: "Factsheet",
        options: [true, false],
        sortButtons: false,
        type: "boolean"
      },
      {
        name: "themes",
        title: "Themes",
        options: ["Marine spatial planning", "Education", "Ecosystem assessment", "Environmental impact assessment", "Ecosystem services"],
        sortButtons: false,
        type: "multiple"
      },
      {
        name: "country",
        title: "Country",
        options: unique_country,
        sortButtons: false,
        type: "search"
      },
      {
        name: "region",
        title: "Region",
        options: unique_region,
        sortButtons: false,
        type: "search"
      },
      {
        name: "license_number",
        title: "License",
        options: unique_license,
        sortButtons: false,
        type: "search"
      }
    ].to_json
  end

  def pagination(page, total_count)
    page ||= 1
    {
      current_page: page,
      page_items_start: page * 10 - 9,
      page_items_end: [page * 10, total_count].min,
      total_items: total_count,
      total_pages: (total_count / 10.0).ceil,
      items: @metadata
    }.to_json
  end
end
