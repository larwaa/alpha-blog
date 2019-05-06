class Admin::TextQuestionsController < AdminController
	before_action :set_question, only: [:edit, :show, :update, :destroy, :field?]

	def new
		@text_question = TextQuestion.new
	end

	def create
		@text_question = TextQuestion.new(text_question_params)
		respond_to do |format|
			if @text_question.save
				format.html {redirect_to admin_text_questions_path}
				format.js { }
			else
				redirect_to admin_text_questions_path
			end
		end
	end

	def destroy
		respond_to do |format|
			if @text_question.destroy
				format.html {redirect_to admin_text_questions_path}
				format.js { }
			else
				redirect_to admin_text_questions_path
			end
		end
	end

	def edit

	end

	def update
		respond_to do |format|
			if @text_question.update(text_question_params)
				format.html { redirect_to admin_text_questions_path }
				format.js { }
			else
				redirect_to admin_text_questions_path
			end
		end

	end

	def show

	end

	def index
		@text_questions = TextQuestion.all
		@text_question = TextQuestion.new
	end

	def field?
		@text_question.rows > 1
	end

	private
	def text_question_params
		params.require(:text_question).permit(:question, :tooltip, :locked, :rows)
	end

	def set_question
		@text_question = TextQuestion.find(params[:id])
	end
end