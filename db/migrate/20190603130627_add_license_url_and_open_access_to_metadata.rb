class AddLicenseUrlAndOpenAccessToMetadata < ActiveRecord::Migration[5.1]
  def change
    add_column :metadata, :license_url, :string
    add_column :metadata, :open_access, :boolean
  end
end
