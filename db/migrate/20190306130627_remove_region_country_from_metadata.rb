class RemoveRegionCountryFromMetadata < ActiveRecord::Migration[5.1]
  def change
    remove_column :metadata, :region, :string
    remove_column :metadata, :country, :string
  end
end
