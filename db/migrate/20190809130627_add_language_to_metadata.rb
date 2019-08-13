class AddLanguageToMetadata < ActiveRecord::Migration[5.1]
  def change
    add_column :metadata, :language, :string
  end
end
