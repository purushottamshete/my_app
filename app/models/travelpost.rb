class Travelpost < ActiveRecord::Base
	belongs_to :user
	belongs_to :city, foreign_key: "from_city_id", foreign_key: "to_city_id"
	
	validate :from_city_id, presence: true
	validate :to_city_id, presence: true
	validate :travel_date, presence: true
	validate :travel_time, presence: true
	validate :seats_available, presence: true, numericality: { only_integer: true }
	validate :fuel_share, presence: true , numericality: true
	
end
