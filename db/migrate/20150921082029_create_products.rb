class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :stock_level
      t.string :image
      t.string :slug

      t.timestamps null: false
    end
  end
end
