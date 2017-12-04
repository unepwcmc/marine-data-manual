class CreateMetadata < ActiveRecord::Migration[5.1]
  def change
    create_table :metadata do |t|
      t.string :category
      t.string :resource
      t.string :version
      t.string :contact_organisation
      t.string :dataset_id
      t.string :metadata
      t.string :factsheet
      t.boolean :marine_spatial_planning
      t.boolean :education
      t.boolean :environmental_impact_assessment
      t.boolean :ecosystem_assessment
      t.boolean :ecosystem_services

    end
  end
end
