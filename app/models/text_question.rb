class TextQuestion < ApplicationRecord
	validates :tooltip, presence: true
	validates :question, presence: true
	validate :locked_question_validation

	private
	def locked_question_validation
		if locked?
			errors.add("Question is locked and cannot be changed.")
		end
	end
end