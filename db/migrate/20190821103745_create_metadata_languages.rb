class CreateMetadataLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :metadata_languages do |t|
      t.bigint :language_id
      t.bigint :metadata_id

      t.timestamps
    end
  end
end
