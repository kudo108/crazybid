class UserBid < ActiveRecord::Base
  belongs_to :user
  belongs_to :bid
end
