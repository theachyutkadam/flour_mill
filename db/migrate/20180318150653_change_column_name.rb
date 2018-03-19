class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :payments, :Payment_type, :payment_type
  end
end
