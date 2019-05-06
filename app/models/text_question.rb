class TextQuestion < ApplicationRecord
	validates :tooltip, presence: true
	validates :question, presence: true
	has_many :answers

	def find_answer(user_id)
		TextQuestion.answers.find_by(user_id).answer
	end

end