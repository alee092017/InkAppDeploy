class RemoveRatingFromPens < ActiveRecord::Migration[5.1]
  def change
    remove_column :pens, :rating, :integer
  end
end
