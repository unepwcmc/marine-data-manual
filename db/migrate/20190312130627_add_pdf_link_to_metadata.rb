class AddPdfLinkToMetadata < ActiveRecord::Migration[5.1]
  def change
    add_column :metadata, :pdf_link, :string
  end
end
