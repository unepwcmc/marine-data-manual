class CreateMetadataCountries < ActiveRecord::Migration[5.1]
  def change
    create_join_table :metadatas, :countries, table_name: :countries_metadata
  end
end
