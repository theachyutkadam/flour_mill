class AddFamilyMembersToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :family_members, :integer
  end
end
