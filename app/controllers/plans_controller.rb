class PlansController < ApplicationController
  protect_from_forgery
  def new 
    @plan = Plan.new
  end
  def index
    @plans = Plan.where(user_id: params[:id])
  end
  def create
    @plan = Plan.new(plan_params)
    @plan.save!
  end 
  def show
    @plans = Plan.where(user_id: params[:id]).page(params[:page])
    @user = User.find(params[:id])
    check_flg = false
    if current_user.belongings.blank?
      check_flg = true
    end
    current_user.belongings.each do |belonging|
      @belongings = Belonging.where(group_id: belonging.group_id)
      if @belongings.exists?(user_id: @user.id) 
        check_flg = true
      end
    end
    if check_flg == false
      redirect_to users_path
    end
  end
  def detail
    @plan = Plan.find(params[:id])
    @user = User.find(@plan.user_id)
    @comment = Comment.new
    @comments = @plan.comments.all.order('created_at DESC')
  end
  def edit
    @plan = Plan.find(params[:id])
    @plan.update(plan_params)
  end
  def destroy
    @plan = Plan.find(params[:id])  
    @plan.destroy
    head :no_content
  end
  private
  def plan_params
    params.require(:plan).permit(:user_id, :departure, :shelter, :distance, :duration)
  end
end
