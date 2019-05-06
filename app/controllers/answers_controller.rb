class AnswersController < ApplicationController
	before_action :set_answer, only: [:edit, :update]

	def new
		@answer = Answer.new
	end

	def create
		@answer = Answer.new(answer_params.merge(user: current_user))
		respond_to do |format|
			if @answer.save
				@id = @answer.text_question_id
				format.html {redirect_to answers_path}
				format.js { }
			else
				flash[:danger] = "-"
				redirect_to answers_path
			end
		end
	end

	def edit
	end

	def index
		@text_questions = TextQuestion.all
		@answers = current_user.answers
	end

	def update
		respond_to do |format|
			if @answer.update(answer_params)
				@id = @answer.text_question_id
				format.html {redirect_to answers_path}
				format.js { }
			else
				flash[:danger] = "Nope"
				redirect_to answers_path
			end
		end
	end

	def find_answer
		@text_question = TextQuestion.find(params[:id])
		@text_question.answers.find_by(user_id: current_user)
	end

	private
	def answer_params
		params.require(:answer).permit(:answer, :text_question_id)
	end

	def set_answer
		@answer = Answer.find(params[:id])
	end
end