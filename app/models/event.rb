class Event < ApplicationRecord
	belongs_to :company
	validates :description, length: { maximum: 255 }
	validates :event_type, length: { maximum: 64 }
	validates :company_id, presence: true

	def progress
		temp = 0
		if ! :food.nil? and food.length > 0
			temp += 20
		end

		if ! :description.nil? and description.length > 0
			temp += 20
		end

		if ! :event_type.nil? and event_type.length > 0
			temp += 20
		end

		if ! :representatives.nil?
			temp += 20
		end

		if ! :attendees.nil?
			temp += 20
		end

	end
end