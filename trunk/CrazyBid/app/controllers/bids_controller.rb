class BidsController < ApplicationController
  # GET /bids
  # GET /bids.json
  def index
    
    @bids = Bid.find(:all,:conditions=>{:transaction_status=>1},:order=>"bid_end_time");
    @user_bid = UserBid.new;
    @bid = nil;
    if(!params.has_key?(:id)) 
      @bid = Bid.find(:first,:conditions=>{:transaction_status=>1},:order=>"bid_end_time");
    else
      @bid = Bid.find(:first,:conditions=>{:id=>params[:id],:transaction_status=>1},:order=>"bid_end_time");
    end
    @pro = Product.find(:first,:conditions=>{:id=>@bid.product_id});
    @user_bids = UserBid.find(:all,:conditions=>{:bid_id=>@bid.id},:order=>"user_price");
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bids }
    end
  end

  # GET /bids/1
  # GET /bids/1.json
  

  # GET /bids/new
  # GET /bids/new.json
  def new
    @bid = Bid.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bid }
    end
  end

  # GET /bids/1/edit
  def edit
    @bid = Bid.find(params[:id])
  end

  # POST /bids
  # POST /bids.json
  def create
    params[:bid][:transaction_status]=0;
    @bid = Bid.new(params[:bid])
    
    respond_to do |format|
      if @bid.save
        @ac_bids = Bid.find(:all,:conditions=>{:transaction_status=>1},:order=>"bid_end_time");
        @de_bids = Bid.find(:all,:conditions=>{:transaction_status=>0},:order=>"bid_end_time");
        @de_bids.each do |bid|
          start =  bid.bid_start_time;
          ends = bid.bid_end_time;
          if start<=DateTime.now&&DateTime.now<=ends
            bid.update_attributes(:transaction_status=>1);
          end
        end
        @ac_bids.each do |bid|
          start =  bid.bid_start_time;
          ends = bid.bid_end_time;
          if ends<=DateTime.now||DateTime.now<=start
            bid.update_attributes(:transaction_status=>0);
          end
        end
        format.html { redirect_to "/admin/transaction?act=show&id=#{@bid.id}", notice: 'Bid was successfully created.' }
        format.json { render json: @bid, status: :created, location: @bid }
      else
        format.html { render "/admin/transaction?act=new" }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bids/1
  # PUT /bids/1.json
  def update
    @bid = Bid.find(params[:id])

    respond_to do |format|
      if @bid.update_attributes(params[:bid])
        
        @ac_bids = Bid.find(:all,:conditions=>{:transaction_status=>1},:order=>"bid_end_time");
        @de_bids = Bid.find(:all,:conditions=>{:transaction_status=>0},:order=>"bid_end_time");
        @de_bids.each do |bid|
          start =  bid.bid_start_time;
          ends = bid.bid_end_time;
          if start<=DateTime.now&&DateTime.now<=ends
            bid.update_attributes(:transaction_status=>1);
          end
        end
        @ac_bids.each do |bid|
          start =  bid.bid_start_time;
          ends = bid.bid_end_time;
          if ends<=DateTime.now||DateTime.now<=start
            bid.update_attributes(:transaction_status=>0);
          end
        end
          
      
        format.html { redirect_to "/admin/transaction?act=show&id=#{@bid.id}", notice: 'Bid was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bids/1
  # DELETE /bids/1.json
  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy

    respond_to do |format|
      format.html { redirect_to "/admin/transaction" }
      format.json { head :no_content }
    end
  end
end
