class AddMailToOperator < ActiveRecord::Migration
  def change
    add_column :operators, :mail, :string
  end
end
