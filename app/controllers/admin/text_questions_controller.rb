class Admin::TextQuestionsController < AdminController
	before_action :set_question, only: [:edit, :show, :update]


	def new
		@text_question = TextQuestion.new
	end

	def create
		@text_question = TextQuestion.new(text_question_params)

		if @text_question.save
			flash[:success]
			redirect_to text_questions_path
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		respond_to do |format|
			if @text_question.update(text_question_params)
				format.html { redirect_to text_questions_path }
				format.js { }
			else
				redirect_to text_questions_path
			end
		end

	end

	def show

	end

	def index
		@text_questions = TextQuestion.all
	end

	private
	def text_question_params
		params.require(:text_question).permit(:question, :tooltip, :answer, :locked)
	end

	def set_question
		@text_question = TextQuestion.find(params[:id])
	end
end