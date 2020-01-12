class PlansController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end
  private
    params.require(:plan).permit()
end
