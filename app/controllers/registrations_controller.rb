class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    #complete this method
		if User.create()
			flash[:notice] = 'Registration correct'
			redirect_to root_path
		else
			flash[:notice] = 'registration incorrect, try again'
			redirect_to users_path
		end
	end
end
