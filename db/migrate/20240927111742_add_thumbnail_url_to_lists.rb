class AddThumbnailUrlToLists < ActiveRecord::Migration[7.2]
  def change
    add_column :lists, :thumbnail_url, :string
  end
end
