class Bid < ActiveRecord::Base
  has_one :user
  belongs_to :product
  has_many :user_bids, :dependent => :destroy
end
