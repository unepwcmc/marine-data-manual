class RegionController < ApplicationController
  DEFAULT_ATTRIBUTES = {
    'filters': [],
    'items_per_page': 10,
    'requested_page': 1,
    'sortDirection': 'ASC',
    'sortField': 'id'
  }.freeze

  def index
    @table_headers = Metadata::TABLE_HEADERS
    data, count, all_data = Metadata.metadata(DEFAULT_ATTRIBUTES.as_json, 'regional')
    @metadata = MetadataSerializer.new(data, all_data).pagination(DEFAULT_ATTRIBUTES['requested_page'], count)
  end

  def region_list
    data, count, all_data = Metadata.metadata(permitted_attributes.as_json, 'regional')
    @metadata = MetadataSerializer.new(data, all_data).pagination(permitted_attributes.as_json['requested_page'], count)
    render json: @metadata
  end

  def download
    data = Metadata.metadata(permitted_attributes.as_json, 'regional', false).first
    send_data Metadata.to_csv(data), {
              type: "text/csv; charset=utf-8; header=present",
              disposition: "attachment",
              filename: "marine-data-manual-#{Date.today}.csv" }
  end

  private

  def permitted_attributes
    params.require(:params)
          .permit(:requested_page, :items_per_page, :sortDirection, :sortField,
                  :searchTerm, filters: [:name, :type, options: []])
  end
end
