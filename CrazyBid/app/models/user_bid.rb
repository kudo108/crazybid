class UserBid < ActiveRecord::Base
  belongs_to :user
  belongs_to :bid
  validates :user_price,:numericality => {:greater_than => 0, :less_than =>9999}
end
