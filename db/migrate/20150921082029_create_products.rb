class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :stock_level
      t.string :image_id
      t.string :slug, null: false         
      t.timestamps null: false
    end
  end
end
