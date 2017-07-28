class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@comment = current_user.comments.new(comment_params)
		if @comment.save
			redirect_to meetup_path(@comment.meetup)
		else
			flash[:alert] = "评论创建失败"
			redirect_to :back
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :meetup_id)
	end
end
