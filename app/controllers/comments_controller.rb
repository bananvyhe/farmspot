class CommentsController < ApplicationController	
	#before_action :authenticate_user!
  #before_action :authorize_access_request!
	def create
		@comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
		if @comment.save
			 respond_to do |format|
        format.html { redirect_to @commentable }
        # format.js
      end
    else
      redirect_to @commentable, alert: "Something went wrong"
    end
		 
	end
	private
 		def comment_params
      params.require(:comment).permit(:body, :parent_id)
    end
end