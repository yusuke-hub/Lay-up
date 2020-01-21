class BelongingsController < ApplicationController
  def create
    @belonging = Belonging.new(belonging_params)
    if @belonging.save
      respond_to do |format|
        format.json{render json: @belonging}
    end
  end
  private
  def belonging_params
    params.require(:belonging).permit(:user_id, :group_id, :activation)
  end
end
