class Detail < ActiveRecord::Base
	before_save { self.corp_email = corp_email.downcase }
	belongs_to :city
	validates :user_id, presence: true
	validates :city_id, presence: true
	validates :mobile, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        validates :corp_email, presence: true, format: { with: VALID_EMAIL_REGEX } , uniqueness: { case_sensitive: false }

end
