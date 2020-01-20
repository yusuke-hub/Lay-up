class PlansController < ApplicationController
  protect_from_forgery
  def index
    @plans = Plan.where(user_id: current_user.id)
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.save!
  end 

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
  end
  private
  def plan_params
    params.require(:plan).permit(:user_id, :situation_id, :departure, :shelter, :distance, :duration, :memo)
  end
end
