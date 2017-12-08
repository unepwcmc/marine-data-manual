class MetadataController < ApplicationController
  def index
    @filters = Metadata.filters_to_json
    @metadata = Metadata.metadata_to_json
  end

  def download
    send_data Metadata.to_csv, {
              type: "text/csv; charset=iso-8859-1; header=present",
              disposition: "attachment",
              filename: "marine-data-manual-#{Date.today}.csv" }

  end
end
