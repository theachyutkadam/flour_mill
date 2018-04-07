class AddPaymentTypeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :payment_type, :string
  end
end
