class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save
  end    
  def show
    
  end
  private 
    def comment_params
      params.require(:comment).permit(:comment, :user_id, :plan_id)
    end
end
