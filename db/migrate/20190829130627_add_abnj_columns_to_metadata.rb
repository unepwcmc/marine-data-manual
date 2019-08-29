class AddAbnjColumnsToMetadata < ActiveRecord::Migration[5.1]
  def change
    add_column :metadata, :abnj_rel, :boolean
    add_column :metadata, :abnj_proj, :boolean
  end
end
