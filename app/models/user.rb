class User < ActiveRecord::Base
	has_many :travelposts, dependent: :destroy
	has_many :microposts, dependent: :destroy
	has_one :detail
	before_save { self.email = email.downcase }

	validates :fname, presence: true, length: {maximum: 30}
	validates :lname, presence: true, length: {maximum: 30}
	validates :have_a_car, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX } , uniqueness: { case_sensitive: false }
	

	has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    #Micropost.where("user_id = ?", id)
    Travelpost.where("user_id = ?", id)
  end

private
    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
end
