class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :rate

      t.timestamps null: false
    end
  end
end
