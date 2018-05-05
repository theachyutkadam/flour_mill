class AddPreviousAmmountToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :previous_ammount, :float
  end
end
