class AddColumnSoldShoes < ActiveRecord::Migration
  def change
    add_column :shoes, :sold, :boolean, :default => false 
  end
end
