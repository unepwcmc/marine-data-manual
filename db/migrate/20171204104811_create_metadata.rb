class CreateMetadata < ActiveRecord::Migration[5.1]
  def change
    create_table :metadata do |t|
      t.string :category, null: false
      t.string :resource
      t.string :version
      t.string :contact_organisation
      t.string :dataset_id
      t.string :metadata, null: false
      t.string :factsheet, null: false
      t.boolean :marine_spatial_planning, null: false
      t.boolean :education, null: false
      t.boolean :environmental_impact_assessment, null: false
      t.boolean :ecosystem_assessment, null: false
      t.boolean :ecosystem_services, null: false

      t.timestamps
    end
  end
end
