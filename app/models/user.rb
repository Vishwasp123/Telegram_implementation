class User < ApplicationRecord
	has_secure_password

	validates :email, :password, :username, presence: true
end
