class CommentsController < ApplicationController
  protect_from_forgery
  def create
    @comment = Comment.new(comment_params)
    @plan = Plan.find(params[:plan_id])
    if @comment.save
      # respond_to do |format|
      #   format.html 
      #   format.json { }
      # end
      render partial: 'comments/comment', locals: {comment: @comment, plan: @plan}
    else
      render 'plans/detail', @plan, alert: 'コメントを入力してください' 
    end
  end    
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to plan_detail_path(params[:plan_id])
  end
  def show
  end
  private 
    def comment_params
      params.require(:comment).permit(:content, :user_id, :plan_id)
    end
end
