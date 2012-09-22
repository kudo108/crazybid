class CreateUserBids < ActiveRecord::Migration
  def change
    create_table :user_bids do |t|
      t.datetime :time
      t.integer :user_price

      t.timestamps
    end
  end
end
