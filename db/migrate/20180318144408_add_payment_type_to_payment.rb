class AddPaymentTypeToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :Payment_type, :string
  end
end
