class AddUserJobToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_job, :string

  end
end
