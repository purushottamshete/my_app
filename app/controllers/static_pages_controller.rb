class StaticPagesController < ApplicationController
  def home
	if signed_in?
		@micropost = current_user.microposts.build
		@travelpost = current_user.travelposts.build
		@feed_items = current_user.feed.paginate(page: params[:page], limit: 4)
	end
  end

  def help
  end

  def about
  end

	def contact
	end
end
