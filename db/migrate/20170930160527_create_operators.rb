class CreateOperators < ActiveRecord::Migration
  def change
    create_table :operators do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :permanent_address
      t.decimal :salary

      t.timestamps null: false
    end
  end
end
