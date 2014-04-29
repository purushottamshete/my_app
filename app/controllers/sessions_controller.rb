class SessionsController < ApplicationController
	def new
	end

def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])

      # Sign the user in and redirect to the user's show page.
	signin user

	if current_user.detail.blank? 
		flash[:error] = "details are blank edit the content" 
		redirect_to '/edit'
	else
		flash[:success] = "Welcome to the Sample App!"
	      	redirect_to user
	end

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
