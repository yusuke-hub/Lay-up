class UsersController < ApplicationController
  def index
    @users1 = User.all
    # @q = User.ransack(params[:q])
    # @users2 = @q.result(distinct: true)
    # @group = Group.new
    # @Group.add_user_to＿groups.build
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  end

  def update
  end
  private
    def user_params
    	params.require(:user).permit(:email,:encrypted_password,:name,:account_id,:group_id,:profile_image)
    end
end
