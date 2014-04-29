class StaticPagesController < ApplicationController
  def home
	if signed_in?
		@micropost = current_user.microposts.build
		@feed_items = current_user.feed.paginate(page: params[:page], limit: 4)
	end
  end

  def help
  end

  def about
  end

  def contact
  end

  def travel_search
	if params[:travelpost]
	t0 = Travelpost.all
	t1 = t0.where(from_city_id: params[:travelpost][:from_city_id])
	t2 = t1.where(to_city_id: params[:travelpost][:to_city_id])
	#t3 = t0.where(travel_date: params[:travelpost][:travel_date])
	@feed_items = t2.paginate(page: params[:page], limit: 4)
	
	end
  end
 
  def travel_search_result
	#@feed_items = Travelpost.all.paginate(page: params[:page], limit: 4)
	t0 = Travelpost.all
	t1 = t0.where(from_city_id: params[:travelpost][:from_city_id])
	t2 = t1.where(to_city_id: params[:travelpost][:to_city_id])
	#t3 = t0.where(travel_date: params[:travelpost][:travel_date])
	@feed_items = t2.paginate(page: params[:page], limit: 4)
  end

  def travel_create
	if signed_in?
		@travelpost = current_user.travelposts.build
	end
  end
end
