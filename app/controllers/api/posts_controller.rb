module Api
	class PostsController < ApplicationController

respond_to :json

def index
		@posts = Post.all
  
 		respond_with @posts

		end

def show
     @post = Post.find(params[:id])
     respond_with @post
end	
	end

end

