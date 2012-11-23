class Product < ActiveRecord::Base
  has_many :bids, :dependent => :destroy
  validates :product_price, :presence => true
  validates :product_name, :presence => true 
  validates :product_description, :presence => true
  def self.save(upload)
        require 'fileutils'
        tmp = upload[:datafile].tempfile
        file = File.join("app/assets/images",upload[:datafile].original_filename)
        FileUtils.cp tmp.path, file
        upload.delete :datafile
    super save
  end
  
  # has_attached_file :image,
                    # :storage => :database
                    # :styles => { :thumb => "75x75>", :small => "150x150>" },
                    #:url => '/:class/:id/:attachment'
  # default_scope select_without_file_columns_for(:image)
end
