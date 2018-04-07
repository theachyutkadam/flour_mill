class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :customer_id
      t.float :payment

      t.timestamps null: false
    end
  end
end