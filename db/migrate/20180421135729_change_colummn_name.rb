class ChangeColummnName < ActiveRecord::Migration
  def change
  	rename_column :payments, :payment_type, :receiver
  end
end
