class CompaniesController < ApplicationController
	before_action :company_params, only: [:create]
	before_action :set_company, only: [:show]
	before_action :require_same_user, only: [:show]
	helper_method :events, :has_events?

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(company_params.merge(user: current_user))
		if @company.save
			flash[:success] = "The company was successfully created."
			redirect_to company_path
		else
			render 'new'
		end
	end

	def show
		@events = @company.events
	end

	def index
		@companies = Company.all
	end

	def events
		@event = Event.find_by(company: @company)
	end

	def has_events?
		!!events
	end

	private
	def set_company
		@company = Company.find(params[:id])
	end

	def company_params
		params.require(:company).permit(:name, :description, :user)
	end

	def require_same_user
		set_company
		if current_user.company != @company and ! current_user.admin? #sjekke også om man hører til bedriften
			flash[:danger] = "You can only view your own company's page"
			redirect_to root_path
		end
	end
end