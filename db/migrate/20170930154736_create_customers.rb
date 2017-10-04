class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :address
      t.string :mobile_num

      t.timestamps null: false
    end
  end
end
