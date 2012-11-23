class AddAwardToBids < ActiveRecord::Migration
  def change
    add_column :bids, :award, :integer, :default=>0
  end
end
