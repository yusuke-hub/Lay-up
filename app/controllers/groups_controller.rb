class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.belongings.build
  end

  def index
    @belongings = Belonging.where(user_id: current_user.id)
    @groups = Group.where(id: @belongings)
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
    @belongings = Belonging.where(user_id: current_user.id)
  end

  private
    def group_params
    	params.require(:group).permit(:name,:caption)
    end
end

# 自分が属しているグループたちに、
# 相手のユーザーが属しているかを調べる


# @user = User.find(params[:id])
# current_user.belongings.each do |belonging|
#   if Belonging.exists(user_id: @user)
#     redirect_to user_path(@user)
#   end
# end

# redirect_to groupu_path()