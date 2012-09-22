class AddUserAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_address, :string

  end
end
