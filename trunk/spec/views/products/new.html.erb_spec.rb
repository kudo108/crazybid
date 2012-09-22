require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :product_name => "MyString",
      :product_price => 1,
      :product_description => "MyString"
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path, :method => "post" do
      assert_select "input#product_product_name", :name => "product[product_name]"
      assert_select "input#product_product_price", :name => "product[product_price]"
      assert_select "input#product_product_description", :name => "product[product_description]"
    end
  end
end
