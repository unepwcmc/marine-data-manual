class MetadataSerializer
  TABLE_HEADERS = [
    {
      name: "category",
      title: "Category",
      sortButtons: true,
      onMobile: false
    },
    {
      name: "resource",
      title: "Resource",
      sortButtons: true,
      onMobile: true
    },
    {
      name: "contact_organisation",
      title: "Contact Organisation",
      sortButtons: true,
      onMobile: false
    },
    {
      name: "themes",
      title: "Themes",
      sortButtons: false,
      onMobile: false
    }
  ].to_json

  def self.filters_to_json
    metadata = Metadata.all
    unique_categories = metadata.pluck(:category).compact.uniq.sort

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
      }
    ].to_json
  end

  def self.metadata(params)
    output = []
    filters = sanitize_params(params['filters'])
    filter_data = params.dig('filters').present? ? Metadata.where(filters) : Metadata.all
    metadata = sorting_data(params, filter_data)
    metadata.to_a.each do |meta|
      meta_attributes = meta.attributes
      meta_attributes[:metadata] = metadata_url(meta)
      meta_attributes[:themes] = []
      ["marine_spatial_planning", "education", "environmental_impact_assessment",
      "ecosystem_assessment", "ecosystem_services"].each do |attribute|
        meta_attributes[:themes] << attribute.capitalize.tr('_', ' ') if meta_attributes[attribute]
        meta_attributes.delete(attribute)
      end
      meta_attributes.delete_if { |k| ["created_at", "updated_at"].include? k }
      output << meta_attributes
    end
    pagination(params['requested_page'], output, filter_data)
  end

  def self.pagination(page, items, total)
    page ||= 1
    {
      current_page: page,
      page_items_start: page * 10 - 9,
      page_items_end: [page * 10, total.count].min,
      total_items: total.count,
      total_pages: (total.count / 10.0).ceil,
      items: items
    }.to_json
  end

  def self.sorting_data(params, data)
    field = params['sortField'].presence || 'id'
    direction = params['sortDirection'].presence || 'ASC'
    data.order("#{field} #{direction}")
        .paginate(page: params['requested_page'] || 1, per_page: 10)
  end

  def self.sanitize_params(filters)
    return if filters.nil?
    query = {}
    filters.each do |filter|
      if filter['name'] == 'themes' && filter['options'].present?
        filter['options'].each { |option| query[option.parameterize.underscore] = 'true' }
      else
        query[filter['name']] = filter['options']
      end
    end
    query.delete_if { |_k, v| v.empty? }
  end

  def self.metadata_url(meta)
    meta.metadata ? pdf_download_link : nil
  end

  def self.pdf_download_link
    "http://wcmc.io/metadata"
  end
end
