class MetadataController < ApplicationController
  DEFAULT_ATTRIBUTES = {
    'filters': [],
    'items_per_page': 10,
    'requested_page': 1,
    'sortDirection': 'ASC',
    'sortField': 'id'
  }.freeze

  def index
    @filters = MetadataSerializer.filters_to_json
    @table_headers = MetadataSerializer::TABLE_HEADERS
    @metadata = MetadataSerializer.metadata(DEFAULT_ATTRIBUTES.as_json)
  end

  def metadata_list
    @metadata = MetadataSerializer.metadata(permitted_attributes.as_json)

    render json: @metadata
  end

  def download
    send_data Metadata.to_csv, {
              type: "text/csv; charset=iso-8859-1; header=present",
              disposition: "attachment",
              filename: "marine-data-manual-#{Date.today}.csv" }

  end

  private

  def permitted_attributes
    params.require(:params)
          .permit(:requested_page, :items_per_page, :sortDirection, :sortField, filters: [:name, :type, options: []])
  end
end
