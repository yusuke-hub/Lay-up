class GroupsController < ApplicationController
  def index
  end

  def create
  	@group = Group.new(group_params)
  end
  def edit
  end

  def show
  end

  private
    def group_params
    	params.require(:group).permit(:name,:caption)
    end
end
