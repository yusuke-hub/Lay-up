class GroupsController < ApplicationController
  def new
    @group = Group.new
    @belonging = @group.belongings.build
  end
  def index
    @belongings = current_user.belongings.where(activation: true)
  end
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to  groups_path
    else
      render 'new'
    end
  end
  def confirm
    @invited_belonging = current_user.belongings.where(activation: false)
  end
  def show
    @group = Group.find(params[:id])
    @group_users = @group.users
  end
  def edit
    @group = Group.find(params[:id])
  end
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to  groups_path
    end
  end
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end
  private
    def group_params
    	params.require(:group).permit(:name, :caption, belongings_attributes:[:id, :group_id, :user_id, :activation])
    end
end

