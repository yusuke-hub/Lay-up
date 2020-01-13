class UsersController < ApplicationController
  def index
    @users1 = User.all
    @group = Group.new
    @group.add_user_to_groups.build
    @search = User.search(params[:q])
    @users2 = @search.result(distinct: true)
    # @Group.add_user_to＿group.build
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def update
  end
  private
    def user_params
    	params.require(:user).permit(:email,:name,:account_id,:profile_image)
    end
end
