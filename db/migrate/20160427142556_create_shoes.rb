class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.string :amount
      t.references :seller, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
