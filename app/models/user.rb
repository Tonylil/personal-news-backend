class User < ApplicationRecord
	has_secure_password
	has_many :interests
	include BCrypt

	validates :name, presence: true
	validates :username, presence: true, uniqueness: true
	validates :password_digest, presence: true
	
end
