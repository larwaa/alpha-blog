class Event < ApplicationRecord
	belongs_to :company
	validates :description, length: { maximum: 255 }
	validates :event_type, length: { maximum: 64 }
	validates :company_id, presence: true
end