class UsersController < ApplicationController
	
  def show
	@user = User.find(params[:id])
	@microposts = @user.microposts.paginate(page: params[:page], limit: 4)
	if @user.detail 
		@detail = @user.detail
	else
		@detail = Detail.new
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
