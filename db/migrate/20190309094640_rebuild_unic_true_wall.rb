class RebuildUnicTrueWall < ActiveRecord::Migration[5.2]
  def change
  	remove_column :vks, :wall

  	add_column :vks, :wall, :string
  	add_index :vks, :wall
  end
end
