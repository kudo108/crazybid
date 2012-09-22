require 'spec_helper'

describe "user_bids/index" do
  before(:each) do
    assign(:user_bids, [
      stub_model(UserBid,
        :time => "",
        :user_price => 1
      ),
      stub_model(UserBid,
        :time => "",
        :user_price => 1
      )
    ])
  end

  it "renders a list of user_bids" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
