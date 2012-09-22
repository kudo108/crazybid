require 'spec_helper'

describe "user_bids/edit" do
  before(:each) do
    @user_bid = assign(:user_bid, stub_model(UserBid,
      :time => "",
      :user_price => 1
    ))
  end

  it "renders the edit user_bid form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_bids_path(@user_bid), :method => "post" do
      assert_select "input#user_bid_time", :name => "user_bid[time]"
      assert_select "input#user_bid_user_price", :name => "user_bid[user_price]"
    end
  end
end
