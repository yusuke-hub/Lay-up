class CommentsController < ApplicationController
  protect_from_forgery
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html 
        format.json { render json: @comment}
      end
    else
      render :detail, alert: 'コメントを入力してください' 
    end
  end    
  def show
  end
  private 
    def comment_params
      params.require(:comment).permit(:content, :user_id, :plan_id)
    end
end
