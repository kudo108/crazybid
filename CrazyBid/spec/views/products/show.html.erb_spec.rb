require 'spec_helper'

describe "products/show" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :product_name => "Product Name",
      :product_price => 1,
      :product_description => "Product Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Product Name/)
    rendered.should match(/1/)
    rendered.should match(/Product Description/)
  end
end
