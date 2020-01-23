class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.belongings.build
  end

  def index
    @belongings = current_user.belongings
  end

  def create
  	@group = Group.new(group_params)
    @group.belongings.build user: current_user
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
    @belongings = current_user.belongings
    @invited_belonging = @belongings.where(activation: false)
    @invited_belonging.each do |belonging|
      @belonging= belonging
      @invited_group = Group.find_by(id: belonging.group_id)
    end
  end

  private
    def group_params
    	params.require(:group).permit(:name,:caption)
    end
end