class EventsController < ApplicationController
	before_action :event_params, only: [:create, :update]
	before_action :set_event, only: [:edit, :update, :destroy]

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params.merge(company: current_company))
		if @event.save && current_company.save
			flash[:success] = "Event details have been created"
			if company_logged_in?
				redirect_to company_path(current_company)
			else
				redirect_to root_path
			end
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @event.update(event_params.merge(company: current_company))
			flash[:success] = "Event details successfully updated"
			redirect_to company_path(current_company)
		else
			render 'edit'
		end
	end

	def destroy
		respond_to do |format|
			if @event.destroy
				format.html { redirect_to company_path(current_company) }
				format.js { }
			else
				redirect_to company_path(current_company)
			end
		end
	end

	private
	def set_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:stand, :description, :representatives, :food, :event_type, :attendees)
	end
end