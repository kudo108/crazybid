class AddUserRealnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_realname, :string

  end
end
