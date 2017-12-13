class MetadataFactsheetCanBeNil < ActiveRecord::Migration[5.1]
  def change
    change_column_null :metadata, :factsheet, true
  end
end
