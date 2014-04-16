class SessionsController < ApplicationController
	def new
	end

def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])

      # Sign the user in and redirect to the user's show page.
	signin user
	flash[:success] = "Welcome to the Sample App!"
      	redirect_to user

    else

      flash[:error] = 'Invalid email/password combination' # Not quite right!

      render 'new'

    end
end
	def destroy
		signout
		redirect_to '/'
	end
end
