class AddLeftAmmountToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :left_ammount, :float
  end
end
