class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.decimal :price
      t.float :weight
      t.references :customer, index: true
      t.references :operator, index: true

      t.timestamps null: false
    end
    add_foreign_key :products, :customers
    add_foreign_key :products, :operators
  end
end
