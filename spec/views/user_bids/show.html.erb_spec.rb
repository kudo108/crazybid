require 'spec_helper'

describe "user_bids/show" do
  before(:each) do
    @user_bid = assign(:user_bid, stub_model(UserBid,
      :time => "",
      :user_price => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/1/)
  end
end
