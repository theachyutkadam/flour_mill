class AddGiverToPayment < ActiveRecord::Migration
  def change
  	add_column :payments, :giver, :string
  end
end
