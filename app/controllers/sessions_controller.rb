class SessionsController < ApplicationController
	def new
    @user = User.new(id: cookies[:registrationcookie])
	end

	def create
		#complete this method
    user = User.find_by_email(params[:email])
		if user && User.authenticate(params[:email], params[:password])
			session[:current_user_id] = user.id
      cookies[:registrationcookie] = user.id
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
    cookies.delete(:registrationcookie)

		redirect_to root_path
  end

end
