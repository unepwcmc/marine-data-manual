class CreateMetadata < ActiveRecord::Migration[5.1]
  def change
    create_table :metadata do |t|
      t.string :category, null: false
      t.string :resource, null: false
      t.string :version
      t.string :contact_organisation, null: false
      t.string :dataset_id, null: false
      t.string :metadata, null: false
      t.string :factsheet
      t.boolean :marine_spatial_planning, null: false
      t.boolean :education, null: false
      t.boolean :environmental_impact_assessment, null: false
      t.boolean :ecosystem_assessment, null: false
      t.boolean :ecosystem_services, null: false

      t.timestamps
    end
  end
end
