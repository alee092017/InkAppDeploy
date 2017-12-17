class AddUserIdToPens < ActiveRecord::Migration[5.1]
  def change
    add_column :pens, :user_id, :int
  end
end
