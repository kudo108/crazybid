class AddUserYobToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_yob, :integer

  end
end
