require 'spec_helper'

describe "bids/show" do
  before(:each) do
    @bid = assign(:bid, stub_model(Bid,
      :bid_start_time => "",
      :bid_end_time => "",
      :bid_tax => 1,
      :bid_unit_cost => 2,
      :transaction_status => "Transaction Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Transaction Status/)
  end
end
