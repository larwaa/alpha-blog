class Answer < ApplicationRecord
	belongs_to :text_question
	belongs_to :user
	validate :locked_question_validation

	private
	def locked_question_validation
		if text_question.locked?
			errors.add("This question is locked and the answer cannot be changed.")
		end
	end
end