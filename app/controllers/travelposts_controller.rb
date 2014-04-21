class TravelpostsController < ApplicationController
	    before_action :signed_in_user, only: [:create, :destroy]

def create
    @travelpost = current_user.travelposts.build(travelpost_params)

    if @travelpost.save
      flash[:success] = "Travelpost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
end

        def destroy
        end

        def index
        end
private
    def travelpost_params
      params.require(:travelpost).permit(:from_city_id,:to_city_id,:travel_date,:travel_time,:seats_available,:fuel_share)
    end

end
