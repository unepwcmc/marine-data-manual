class ChangeMetadataToBoolean < ActiveRecord::Migration[5.1]
  def change
    change_column :metadata, :metadata, 'boolean USING CAST(metadata AS boolean)'
  end
end
