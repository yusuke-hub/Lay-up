class UsersController < ApplicationController
  def index
    @users = User.all
    @group = Group.new
    @group.belongings.build
    @search = User.search(params[:q])
      if params[:q]
        @results = @search.result(distinct: true)
      else
        @results = User.all
      end
    # @belongings = Belonging.where(user_id: current_user.id)
    # @groups = Group.where(id: @belongings)
  end

  def show
  	@user = User.find(params[:id])
    current_user.belongings.each do |belonging|
      if belonging.exists(user_id: @user)?
        redirect_to user_path(@user)
      else
        render 'index'
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    # @user.update(user_params)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  private
    def user_params
    	params.require(:user).permit(:email,:name,:account_id,:profile_image,:phone_number)
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