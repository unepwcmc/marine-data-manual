class MetadataSerializer
  def initialize(metadata, all_data)
    @metadata = metadata
    @all_data = all_data
  end

  def filters
    # byebug 
    unique_categories = @all_data.pluck('category').compact.uniq.sort
    unique_country = Country.pluck(:name).sort
    unique_region = Region.pluck(:name).sort
    unique_license = @all_data.pluck('license_number').compact.uniq.sort
    unique_resource = @all_data.pluck('resource').compact.uniq.sort

    [
      {
        name: "category",
        title: "Category",
        filter: true,
        options: unique_categories,
        sortButtons: true
      },
      {
        name: "resource",
        title: "Resource",
        filter: true,
        options: unique_resource,
        sortButtons: true,
        type: 'search'
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
        filter: true,
        options: [true, false],
        sortButtons: false,
        type: "boolean"
      },
      {
        name: "themes",
        title: "Themes",
        filter: true,
        options: ["Marine spatial planning", "Education", "Ecosystem assessment", "Environmental impact assessment", "Ecosystem services"],
        sortButtons: false,
        type: "multiple"
      },
      {
        name: "country",
        title: "Country",
        filter: true,
        options: unique_country,
        sortButtons: false,
        type: "search"
      },
      {
        name: "region",
        title: "Region",
        filter: true,
        options: unique_region,
        sortButtons: false,
        type: "search"
      },
      {
        name: "license_number",
        title: "Licence",
        filter: true,
        options: unique_license,
        sortButtons: false,
        type: "search",
        selectMultiple: {
          title: "Select ALL open access licences",
          filter: "open_access"
        }
      }
    ]
  end

  def pagination(page, total_count)
    page ||= 1
    {
      filters: filters,
      current_page: page,
      page_items_start: page * 10 - 9,
      page_items_end: [page * 10, total_count].min,
      total_items: total_count,
      total_pages: (total_count / 10.0).ceil,
      items: @metadata
    }.to_json
  end
end
