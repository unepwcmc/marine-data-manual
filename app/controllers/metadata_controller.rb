class MetadataController < ApplicationController
  def index
    @filters = Metadata.filters_to_json
    @table_headers = Metadata.table_headers_to_json
    @metadata = Metadata.metadata.to_json
  end

  def metadata_list 
    
    #TODO - LUCA - use posted parameters and make data below dynamic dynamic
    @metadata = {
      current_page: 1,
      page_items_start: 1,
      page_items_end: 10,
      total_items: 100,
      total_pages: 10,
      items: Metadata.metadata
    }

    render json: @metadata
  end

  def download
    send_data Metadata.to_csv, {
              type: "text/csv; charset=iso-8859-1; header=present",
              disposition: "attachment",
              filename: "marine-data-manual-#{Date.today}.csv" }

  end
end
