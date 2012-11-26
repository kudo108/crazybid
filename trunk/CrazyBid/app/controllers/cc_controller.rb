class CcController < ApplicationController
	def index
	if user_signed_in?
	@user = User.find(current_user.id)
	@user.update_attributes(:user_balance=>100000)
	redirect_to "/"
	else
	redirect_to "/"
	end
	
	end
end
