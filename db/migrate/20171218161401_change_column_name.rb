class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :reviews, :movie_id, :pen_id
  end
end


#dammit dude, really?
