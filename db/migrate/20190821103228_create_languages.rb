class CreateLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :languages do |t|
      t.string :language_id
      t.string :name

      t.timestamps
    end
  end
end
