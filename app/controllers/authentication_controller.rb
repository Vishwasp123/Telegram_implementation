class AuthenticationController < ApplicationController

	skip_before_action :authenticate_request

	def login
		debugger
		@user  = User.find_by_email( params[:email] )
		if @user&.authenticate(params[:password])
			token = jwt_encode(user_id: @user_id)
			render json: {token: token}, status: :ok
		else  
			render json: {errors: "Unathorized"}, status: :unauthorized
		end
	end
end
