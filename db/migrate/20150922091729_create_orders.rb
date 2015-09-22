class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email
      t.decimal :total

      t.timestamps null: false
    end
  end
end
