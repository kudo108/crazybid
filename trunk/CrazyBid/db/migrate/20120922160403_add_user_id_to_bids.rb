class AddUserIdToBids < ActiveRecord::Migration
  def change
    add_column :bids, :winner_user_id, :integer

  end
end
