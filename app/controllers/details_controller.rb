class DetailsController < ApplicationController
	def new
		@detail = Detail.new
	end

	def create
                if @detail.save
                        flash[:success] = "Details updated successfully"
                        redirect_to @user
                else
                        render 'new' #TODO
                end

	end

	def update
	end

	private

	def user_params
      		params.require(:detail).permit(:corp_id, :mobile, :have_a_car, :city_id)
    	end

end
