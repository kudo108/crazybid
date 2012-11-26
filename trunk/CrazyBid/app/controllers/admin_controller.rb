class AdminController < ApplicationController
	def index
		if(current_user.level<2)
		@products = Product.all;
		respond_to do |format|
		  format.html {render :layout=>false}# index.html.erb
		  format.json { render json: @user_bids }
		end
		else
		render :nothing=>true
		end
		
	end
	def transaction
		if(current_user.level<2)
		@bids = Bid.all;
		@n_bids = Bid.find(:all,:conditions=>{:transaction_status=>"1"})
		@products = Product.all;
		@all_product = Array.new;
		ac_product = Array.new
		@n_bids.each do|bid|
			ac_product.push(bid.product_id)
		end
		@products.each do |product|
			@all_product.push(product.id)
		end
		@all_product.delete_if{|x|
		 ac_product.include?x
		}
		
		respond_to do |format|
		  format.html {render :layout=>false}# index.html.erb
		  format.json { render json: @user_bids }
		end
		else
		render :nothing=>true
		end
	end
	def user
		if(current_user.level<2)			
		@users = User.all;
		respond_to do |format|
		  format.html {render :layout=>false}# index.html.erb
		  format.json { render json: @user_bids }
		end
		else
		render :nothing=>true
		end
	end
	def destroy
		if(current_user.level<2)
		 if params.has_key?(:act)
			if params[:act]
				user = User.find(params[:id]);
				if user.destroy
					redirect_to "/admin/user";
				end
			end
		end
		else
		render :nothing=>true
		end
	end
	def win
	if(current_user.level<2)
			if params.has_key?(:id)
				ward = Bid.find(params[:id]);
				ward.update_attributes(:award=>1)	
			end
		@wins = Bid.find(:all,:conditions=>{:transaction_status=>"0"});
		respond_to do |format|
		  format.html {render :layout=>false}# index.html.erb
		  format.json { render json: @user_bids }
		end
		else
		render :nothing=>true
		end
	end
	def history
	if(current_user.level<2)
	@user_bids = UserBid.find(:all,:order=>"time DESC")
		respond_to do |format|
		  format.html {render :layout=>false}# index.html.erb
		  format.json { render json: @user_bids }
		end
	else
		render :nothing=>true
		end
	end
	
end
