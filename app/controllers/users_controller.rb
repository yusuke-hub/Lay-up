class UsersController < ApplicationController
  def index
    @users = User.all
    @group = Group.new
    @group.add_user_to_groups.build
    @search = User.search(params[:q])
    @results =
      if params[:q].empty?
        User.none
      else
        @search.result(distinct: true)
      end
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
