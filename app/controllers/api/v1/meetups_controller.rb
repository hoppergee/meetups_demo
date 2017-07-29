class Api::V1::MeetupsController < ApiController

	def index
		@meetups = Meetup.paginate( :page => params[:page] )
	end

end
