require 'spec_helper'

describe "bids/new" do
  before(:each) do
    assign(:bid, stub_model(Bid,
      :bid_start_time => "",
      :bid_end_time => "",
      :bid_tax => 1,
      :bid_unit_cost => 1,
      :transaction_status => "MyString"
    ).as_new_record)
  end

  it "renders new bid form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bids_path, :method => "post" do
      assert_select "input#bid_bid_start_time", :name => "bid[bid_start_time]"
      assert_select "input#bid_bid_end_time", :name => "bid[bid_end_time]"
      assert_select "input#bid_bid_tax", :name => "bid[bid_tax]"
      assert_select "input#bid_bid_unit_cost", :name => "bid[bid_unit_cost]"
      assert_select "input#bid_transaction_status", :name => "bid[transaction_status]"
    end
  end
end
