class HomeController < ApplicationController
  def index
    @bids = Bid.find(:all,:conditions=>{:transaction_status=>"1"},:order=>"bid_end_time");
    @de_bids = Bid.find(:all,:conditions=>{:transaction_status=>"0"},:order=>"bid_end_time");
    @de_bids.each do |bid|
      start =  bid.bid_start_time;
      ends = bid.bid_end_time;
      if start<=DateTime.now&&DateTime.now<=ends
        bid.update_attributes(:transaction_status=>"1");
      end
    end
    @bids.each do |bid|
      start =  bid.bid_start_time;
      ends = bid.bid_end_time;
      if ends<=DateTime.now||DateTime.now<=start
        bid.update_attributes(:transaction_status=>"0");
      end
    end
  end
end
