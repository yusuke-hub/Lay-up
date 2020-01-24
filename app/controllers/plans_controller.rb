class PlansController < ApplicationController
  protect_from_forgery
  def index
    @plans = Plan.where(user_id: params[:id])
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.save!
  end 

  def show
    @plans = Plan.where(user_id: params[:id])
    @user = User.find(params[:id])
    check_flg = false
    current_user.belongings.each do |belonging|
      @belongings = Belonging.where(group_id: belonging.group_id)
        if @belongings.exists?(user_id: @user.id)
          check_flg = true
        end
    end
    if check_flg == false
      redirect_to plan_path(current_user.id)
    end
  end

  def detail
    @plan = Plan.find(params[:id])
    @user = User.find(@plan.user_id)
    @comment = Comment.new
    @comments = Comment.order('created_at ASC')
  end

  def destroy
    @plan = Plan.find(params[:id])  
    @plan.destroy
    redirect_to plan_path(current_user.id)
  end
  def edit
    @plan = Plan.find(params[:id])
    @plan.update(plan_params)
  end
  private
  def plan_params
    params.require(:plan).permit(:user_id, :departure, :shelter, :distance, :duration)
  end
end
