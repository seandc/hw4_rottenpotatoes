class AddDirectorToMovie < ActiveRecord::Migration
  def up
    add_column :movies, :director, :string
  end

  def down
    drop_column :movies, :director
  end
end
