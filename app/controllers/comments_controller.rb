class CommentsController < ApplicationController

before_action :authenticate_user!

	def create
    	@comment = current_user.comments.build(comment_params)

   	 if @comment.save
     	 redirect_to post_path(@comment.post_id),
                  notice: 'Comment was successfully created.'
   	 else
      redirect_to post_path(@comment.post_id),
                  alert: 'Error creating comment.'
    end
  end

Private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

end
