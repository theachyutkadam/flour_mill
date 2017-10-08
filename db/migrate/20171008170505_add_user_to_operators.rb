class AddUserToOperators < ActiveRecord::Migration
  def change
    add_reference :operators, :user, index: true
    add_foreign_key :operators, :users
  end
end
