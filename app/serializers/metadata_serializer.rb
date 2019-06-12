class MetadataSerializer
  def initialize(metadata, all_data)
    @metadata = metadata
    @all_data = all_data
  end

  def filters
    # byebug
    unique_categories = @all_data.pluck('category').compact.uniq.sort
    unique_license = @all_data.pluck('license_number').compact.uniq.sort
    unique_resource = @all_data.pluck('resource').compact.uniq.sort
    metadata_presence = @all_data.pluck('metadata').compact.uniq.rotate!

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
        options: metadata_presence,
        sortButtons: false,
        type: "boolean"
      },
      {
        name: "themes",
        title: "Themes",
        filter: true,
        options: unique_theme, # ["Marine spatial planning", "Education", "Ecosystem assessment", "Environmental impact assessment", "Ecosystem services"],
        sortButtons: false,
        type: "multiple"
      },
      {
        name: "country",
        title: "Country",
        filter: true,
        options: unique_location('country'),
        sortButtons: false,
        type: "search"
      },
      {
        name: "region",
        title: "Region",
        filter: true,
        options: unique_location('region'),
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

  def unique_location(location)
    uniq_data = []
    place = location.pluralize.to_sym
    datas = @all_data.includes(place)
    datas.each do |data|
      uniq_data << data.public_send(place).pluck(:name)
    end
    uniq_data.flatten.uniq.sort
  end

  def unique_theme
    themes = []
    @all_data.each do |data|
      themes << data.attributes
                    .select { |_k, v| v == true }
                    .delete_if { |k, _v| k.in? %w[metadata open_access] }
                    .keys
    end
    themes.flatten.uniq.map(&:humanize).sort
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
