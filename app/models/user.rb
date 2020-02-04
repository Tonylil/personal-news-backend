class User < ApplicationRecord
	has_many :interests
	include BCrypt

	
end
