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
    data, count, all_data = Metadata.metadata(DEFAULT_ATTRIBUTES.as_json)
    @metadata = MetadataSerializer.new(data, all_data).pagination(DEFAULT_ATTRIBUTES['requested_page'], count)
  end
end