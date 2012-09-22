require 'spec_helper'

describe "bids/index" do
  before(:each) do
    assign(:bids, [
      stub_model(Bid,
        :bid_start_time => "",
        :bid_end_time => "",
        :bid_tax => 1,
        :bid_unit_cost => 2,
        :transaction_status => "Transaction Status"
      ),
      stub_model(Bid,
        :bid_start_time => "",
        :bid_end_time => "",
        :bid_tax => 1,
        :bid_unit_cost => 2,
        :transaction_status => "Transaction Status"
      )
    ])
  end

  it "renders a list of bids" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Transaction Status".to_s, :count => 2
  end
end
