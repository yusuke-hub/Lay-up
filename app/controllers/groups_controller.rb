class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.belongings.build
  end

  def index
    @middle = Belonging.where(user_id: current_user.id)
    @groups = Group.where(id: @middle)
  end

  def create
  	@group = Group.new(group_params)
    @group.belongings.build user: current_user
    @group.save
    redirect_to users_path
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
