require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :product_name => "Product Name",
        :product_price => 1,
        :product_description => "Product Description"
      ),
      stub_model(Product,
        :product_name => "Product Name",
        :product_price => 1,
        :product_description => "Product Description"
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Product Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Product Description".to_s, :count => 2
  end
end
