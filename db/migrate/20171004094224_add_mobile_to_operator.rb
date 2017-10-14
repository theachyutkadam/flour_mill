class AddMobileToOperator < ActiveRecord::Migration
  def change
    add_column :operators, :mobile, :string
  end
end
