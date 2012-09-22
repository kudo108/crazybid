class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.datetime :bid_start_time
      t.datetime :bid_end_time
      t.integer :bid_tax
      t.integer :bid_unit_cost
      t.string :transaction_status

      t.timestamps
    end
  end
end
