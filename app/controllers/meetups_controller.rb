class MeetupsController < ApplicationController

	before_action :authenticate_user!, except: [:index,:show]

	def index
		@meetups = Meetup.order("id desc")
	end

	def new
		@meetup = current_user.meetups.new
	end

	def show
		@meetup = Meetup.find(params[:id])
	end

	def create
		@meetup = current_user.meetups.new(meetup_params)
		if @meetup.save
			redirect_to meetups_path
		else
			render action: :new
		end
	end

	private

	def meetup_params
		params.require(:meetup).permit(:title, :description)
	end

end