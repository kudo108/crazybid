class AddUserPhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_phone, :string

  end
end
