class UserBidsController < ApplicationController
  # GET /user_bids
  # GET /user_bids.json
  def index
    @user_bids = UserBid.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_bids }
    end
  end

  # GET /user_bids/1
  # GET /user_bids/1.json
  def show
    @user_bid = UserBid.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_bid }
    end
  end

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
    @user_bid = UserBid.new(params[:user_bid])

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
