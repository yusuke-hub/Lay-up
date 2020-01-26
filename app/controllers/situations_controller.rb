class SituationsController < ApplicationController
  def create
    @situation = Situation.new(situation_params)
  end
  private
  def situation_params
    params.require(:situation).permit(:name, :status)
  end
end
