class UsersController < ApplicationController
  def index
    @users = User.all
    @group = Group.new
    @group.belongings.build
    @search = User.search(params[:q])
    @results =
      if params[:q]
        @search.result(distinct: true)
      else
        User.none
      end
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    # @user.update(user_params)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  private
    def user_params
    	params.require(:user).permit(:email,:name,:account_id,:profile_image,:phone_number)
    end
end
