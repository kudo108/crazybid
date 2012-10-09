class Product < ActiveRecord::Base
  has_many :bids, :dependent => :destroy
  validates :product_price, :presence => true
  validates :product_name, :presence => true 
  validates :product_description, :presence => true
  attr_accessor :product_image
end
