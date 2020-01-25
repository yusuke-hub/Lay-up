class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.belongings.build
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

  def show
    @group_users = Group.find(params[:id]).users
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

  def confirm
    @invited_belonging = current_user.belongings.where(activation: false)
  end

  private
    def group_params
    	params.require(:group).permit(:name, :caption, belongings_attributes:[:user_id, :activation])
    end
end