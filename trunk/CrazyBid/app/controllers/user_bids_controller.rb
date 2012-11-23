class UserBidsController < ApplicationController
  # GET /user_bids
  # GET /user_bids.json
  def index
    @user_bids = UserBid.find(:all,:conditions=>{:user_id=>current_user.id},:order=>"time")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_bids }
    end
  end

  # GET /user_bids/1
  # GET /user_bids/1.json
  

  # GET /user_bids/new
  # GET /user_bids/new.json
  def new
    @user_bid = UserBid.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_bid }
    end
  end

  # GET /user_bids/1/edit
  def edit
    @user_bid = UserBid.find(params[:id])
  end

  # POST /user_bids
  # POST /user_bids.json
  def create
    if(user_signed_in?)
      if(params[:user_bid][:user_price]=="")
        params[:user_bid][:user_price]=0;
      end
      params[:user_bid][:time] = DateTime.now;
      params[:user_bid][:user_id]=current_user.id;
      @user_bid = UserBid.new(params[:user_bid]);
      @bid = Bid.find(:first,:conditions=>{:id=>params[:user_bid][:bid_id],:transaction_status=>"1"});
      remain = current_user.user_balance - @bid.bid_unit_cost;
      if(remain >=0)
      current_user.update_attributes(:user_balance=>remain);
      @user_bid.save;
      end
      redirect_to "/bids/?id=#{params[:user_bid][:bid_id]}";
      return;
      respond_to do |format|
        if @user_bid.save
          format.html { redirect_to @user_bid, notice: 'User bid was successfully created.' }
          format.json { render json: @user_bid, status: :created, location: @user_bid }
        else
          format.html { render action: "new" }
          format.json { render json: @user_bid.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /user_bids/1
  # PUT /user_bids/1.json
  def update
    @user_bid = UserBid.find(params[:id])

    respond_to do |format|
      if @user_bid.update_attributes(params[:user_bid])
        format.html { redirect_to @user_bid, notice: 'User bid was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_bids/1
  # DELETE /user_bids/1.json
  def destroy
    @user_bid = UserBid.find(params[:id])
    @user_bid.destroy

    respond_to do |format|
      format.html { redirect_to user_bids_url }
      format.json { head :no_content }
    end
  end
end
