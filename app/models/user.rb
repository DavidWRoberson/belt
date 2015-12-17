class User < ActiveRecord::Base
	has_many :ideas
	has_many :likes
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name,  
			  presence: true, 
			  :length => { :in => 2..45 }
	validates :last_name, 
			  presence: true, 
			  :length => { :in => 2..45 }
	validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false } 
	validates :alias, 
			  presence: true,
			  :length => { :in => 2..45 }
	validates :password, presence: true, confirmation: true, on: :create,
			  :length => { :in => 8..45 }
end
