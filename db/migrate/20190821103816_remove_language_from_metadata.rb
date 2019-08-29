class RemoveLanguageFromMetadata < ActiveRecord::Migration[5.1]
  def change
    remove_column :metadata, :language, :string
  end
end
