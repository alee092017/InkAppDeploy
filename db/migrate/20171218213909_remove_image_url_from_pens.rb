class RemoveImageUrlFromPens < ActiveRecord::Migration[5.1]
  def change
    remove_column :pens, :image_url, :string
  end
end
