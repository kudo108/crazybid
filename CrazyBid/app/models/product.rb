class Product < ActiveRecord::Base
  has_many :bids, :dependent => :destroy
  validates :product_price, :presence => true
  validates :product_name, :presence => true 
  validates :product_description, :presence => true
  
  def self.save(upload)
    p "AAAAAAAAAAAAAAAAAAAA"
    name =  upload['datafile'].original_filename
    directory = "public"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
    super save
  end
  
  # has_attached_file :image,
                    # :storage => :database
                    # :styles => { :thumb => "75x75>", :small => "150x150>" },
                    #:url => '/:class/:id/:attachment'
  # default_scope select_without_file_columns_for(:image)
end
