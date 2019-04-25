class User < ApplicationRecord
	has_many :articles, dependent: :destroy
	has_one :company
	before_save { self.email = email.downcase }
	validates :username, presence: true,
						uniqueness: { case_sensitive: false },
						length: {minimum: 2, maximum: 25}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
						uniqueness: { case_sensitive: false },
						length: { maximum: 105 },
						format: { with: VALID_EMAIL_REGEX }
	#validates :password, length: { minimum: 8 }
	has_secure_password
end