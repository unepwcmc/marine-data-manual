class AddRegionCountryLicenseToMetadata < ActiveRecord::Migration[5.1]
  def change
    add_column :metadata, :license_number, :string
    add_column :metadata, :region, :string
    add_column :metadata, :country, :string
  end
end
