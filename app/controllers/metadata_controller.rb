class MetadataController < ApplicationController
  DEFAULT_ATTRIBUTES = {
    'filters': [],
    'items_per_page': 10,
    'requested_page': 1
  }.freeze

  def index
    @filters = Metadata.filters_to_json
    @table_headers = Metadata::TABLE_HEADERS
    @metadata = Metadata.metadata(DEFAULT_ATTRIBUTES.as_json)
  end

  def metadata_list
    @metadata = Metadata.metadata(permitted_attributes.as_json)

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
    params.require(:params).permit(:requested_page, :items_per_page, filters: [:name, :type, options: []])
  end
end
