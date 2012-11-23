class CcController < ApplicationController
	def index
	@user = User.find(current_user.id)
	@user.update_attributes(:user_balance=>100000)
	redirect_to "/"
	end
end
