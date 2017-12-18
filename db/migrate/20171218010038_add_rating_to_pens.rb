class AddRatingToPens < ActiveRecord::Migration[5.1]
  def change
    add_column :pens, :rating, :integer
  end
end
