class GroupsController < ApplicationController
  def index
    @middle = AddUserToGroup.where(user_id: current_user.id)
    @groups = Group.where(id: @middle)
    @group = Group.new
    @group.add_user_to_groups.build
  end

  def create
  	@group = Group.new(group_params)
    @group.add_user_to_groups.build user: current_user
    @group.save
    redirect_to groups_path
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
