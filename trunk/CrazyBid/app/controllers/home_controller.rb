class HomeController < ApplicationController
  def index
    @bids = Bid.find(:all,:conditions=>{:transaction_status=>"1"},:order=>"bid_end_time");
    
  end
end
