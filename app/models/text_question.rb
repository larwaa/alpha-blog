class TextQuestion < ApplicationRecord
	validates :tooltip, presence: true
	validates :question, presence: true

end