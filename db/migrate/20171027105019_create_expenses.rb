class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :expence_type
      t.float :expence

      t.timestamps null: false
    end
  end
end
