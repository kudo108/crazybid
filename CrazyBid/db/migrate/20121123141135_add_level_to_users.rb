class AddLevelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :level, :integer, :default=>2
  end
end
