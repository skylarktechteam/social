class ImagePostsController < ApplicationController
	
	def new
        @image_post = ImagePost.new
	end

	 def create
			@image_post = current_user.image_posts.build(image_post_params)
		if @image_post.save
			redirect_to post_path(@image_post),
			notice: "Post created!"
		else
			render :new, alert: "Error creating post."
		end

	end 

	def edit
		@image_post = current_user.image_posts.find(params[:id])
	end 

	def update
		@image_post = current_user.image_posts.find(params[:id])
		if @image_post.update(image_post_params)
		redirect_to post_path(@image_post), notice: "Post updated!"
	else
		render :edit, alert: "Error updating post."
		end
	end 

	private 
	
		def image_post_params
		params.require(:image_post).permit(:title, :url, :body)
		end 
end
