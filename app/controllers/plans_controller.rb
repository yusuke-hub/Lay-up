class PlansController < ApplicationController
  def index
    @user = User.find(params[:id])
    @plans = Plan.where(user_id: @user.id)
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
  end
  private
  def plan_params
    params.require(:plan).permit(:user_id,:situation_id,:d_latitude,:d_name,:s_latitude,:s_longitude,:s_name,:distance,:altitude)
  end
end
