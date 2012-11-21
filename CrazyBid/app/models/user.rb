class User < ActiveRecord::Base

  has_many :bids
  has_many :user_bids, :dependent => :destroy
  validates :email,:presence=>true,:uniqueness=>true
  validates :user_id_card_number,:presence=>true,:length=>{:is=>9},:numericality=>true
  validates :user_realname,:presence=>true
  validates :user_job,:presence=>true
  validates :user_phone,:presence=>true,:length=>(10..11),:numericality=>true
  validates :user_address,:presence=>true
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:user_id_card_number,:user_realname,:user_job,:user_phone,:user_address,:user_balance
end
