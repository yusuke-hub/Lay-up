class BelongingsController < ApplicationController
  protect_from_forgery :except => [:create]
  def create
    @belonging = Belonging.create(user_id: params[:user_id], group_id: params[:group_id])
    @belonging.save
  end
  def update
    @belonging = Belonging.find(params[:id])
    @belonging.update(activation: true)
    redirect_to groups_path
  end
  def destroy
    @belonging = Belonging.find(params[:id])
    @belonging.destroy
    head :no_content
  end
  private
  def belonging_params
    params.require(:belonging).permit(:user_id, :group_id, :activation)
  end
end
