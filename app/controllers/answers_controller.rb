class AnswersController < ApplicationController
	before_action :set_answer, only: [:edit, :update]

	def new
		@answer = Answer.new
	end

	def create
		@answer = Answer.new(answer_params.merge(user: current_user))
		respond_to do |format|
			if @answer.save
				# ID solution for .js.erb files, no id from the @answer variable.
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
				# ID solution for .js.erb files, no id from the @answer variable.
				@id = @answer.text_question_id
				format.html {redirect_to answers_path}
				format.js { }
			else
				flash[:danger] = "Nope"
				redirect_to answers_path
			end
		end
	end

	private
	def answer_params
		params.require(:answer).permit(:answer, :text_question_id)
	end

	def set_answer
		@answer = Answer.find(params[:id])
	end
end