class AddUserIdToUserBids < ActiveRecord::Migration
  def change
    add_column :user_bids, :user_id, :integer

  end
end
