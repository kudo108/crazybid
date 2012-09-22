class AddBidIdToUserBids < ActiveRecord::Migration
  def change
    add_column :user_bids, :bid_id, :integer

  end
end
