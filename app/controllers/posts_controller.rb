class PostsController < ApplicationController
	before_action :authenticate_user!

	def index

		logger.debug "** current_user.inspect = "
		logger.debug current_user.inspect
		  user_ids = current_user.timeline_user_ids

		  debugger

   			@posts = Post.includes(:user).where(user_id: user_ids)
   			.paginate(page: params[:page], per_page: 5)
   			.order("created_at DESC")

   		@posts.each do |post|
        logger.debug "Post #{post.id} is a #{post.type}"
		end
	end

	def show
		@post = Post.includes(comments: [:user]).find(params[:id])
		@can_moderate = (current_user == @post.user)
	end
end
