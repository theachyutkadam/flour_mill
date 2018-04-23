class ChangePaymentColummnName < ActiveRecord::Migration
  def change
  	rename_column :payments, :payment, :payment_ammount
  end
end
