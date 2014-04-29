class UsersController < ApplicationController
	
  def show
	if signed_in?
		@user = User.find(params[:id])
		if @user.detail 
			@detail = @user.detail
		else
			@detail = Detail.new
		end
	
	else
		flash[:error]  = "Please sign in"
		redirect_to '/'
	end
  end

  def edit
	if signed_in?
		@user = current_user
		@details = Detail.new
	else
		flash[:error]  = "Please sign in"
		redirect_to '/'
	end	
  end
	
  def update
  end

  def change_password
	if signed_in?
		@user = current_user
	else
		flash[:error]  = "Please sign in"
		redirect_to '/'
	end	
  end

  def new
	@user = User.new
  end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to the Sample App!"
      			redirect_to @user
		else
			render 'new'
		end
	end

private

    def user_params
      params.require(:user).permit(:fname,:lname,:have_a_car, :email, :password, :password_confirmation)
    end

end
