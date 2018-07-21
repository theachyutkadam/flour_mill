class AddItemForeignKeyToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :item, index: true
    add_foreign_key :products, :items
  end
end
