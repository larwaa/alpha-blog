class Company < ApplicationRecord
	has_many :articles, dependent: :destroy
	has_many :events
	belongs_to :user
	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :description, presence: true, length: {minimum: 10, maximum: 255 }
end