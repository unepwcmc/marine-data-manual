class CreateMetadataRegions < ActiveRecord::Migration[5.1]
  def change
    create_join_table :metadatas, :regions, table_name: :metadata_regions
  end
end
