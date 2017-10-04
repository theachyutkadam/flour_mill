class AddMailToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :mail, :string
  end
end
