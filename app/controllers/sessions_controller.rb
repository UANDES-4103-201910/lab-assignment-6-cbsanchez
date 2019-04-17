class SessionsController < ApplicationController
	cookies["sessions users"] = user_id
	def new
	end

	def create
		#complete this method
		if user = User.authenticate(params[:username], params[:password])
			session[:current_user_id] = user.id
			flash[:notice] = 'User was login successfully '
			redirect_to users_path
		else
			flash[:notice] = 'password or username incorrect'
			redirect_to root_path
		end

	end

	def destroy
		#complete this method
		@_current_user = session[:current_user_id] = nil

		redirect_to root_path
	end
end
