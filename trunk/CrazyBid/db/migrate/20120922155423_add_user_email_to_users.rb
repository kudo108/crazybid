class AddUserEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_email, :string

  end
end
