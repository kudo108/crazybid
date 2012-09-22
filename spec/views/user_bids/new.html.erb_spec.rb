require 'spec_helper'

describe "user_bids/new" do
  before(:each) do
    assign(:user_bid, stub_model(UserBid,
      :time => "",
      :user_price => 1
    ).as_new_record)
  end

  it "renders new user_bid form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_bids_path, :method => "post" do
      assert_select "input#user_bid_time", :name => "user_bid[time]"
      assert_select "input#user_bid_user_price", :name => "user_bid[user_price]"
    end
  end
end
