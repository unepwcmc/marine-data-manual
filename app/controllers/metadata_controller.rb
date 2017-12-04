class MetadataController < ApplicationController
  def index
    @filters = Metadata.filters_to_json
    @metadata = Metadata.metadata_to_json
  end
end
