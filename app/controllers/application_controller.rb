class ApplicationController < ActionController::Base
	
	skip_before_action :verify_authenticity_token
		include JsonWebToken

 before_action :authenticate_request

	private

	def authenticate_request
		header = request.headers["Authorization"]
		header = header.split(" ").last if header
		decoded  = jwt_decoded(header)
		@current_user = User.find(decoded[:user_id])
	end
	xdfcgvhjnkml
end
