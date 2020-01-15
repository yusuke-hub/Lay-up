class UsersController < ApplicationController
  before_action :get_group, only: [:index]
  def index
    @user = User.new
    @search = User.search(params[:q])
      if params[:q]
        @results = @search.result(distinct: true)
      else
        @results = User.all
      end
  end

  def show
  	@user = User.find(params[:id])
    # current_user.belongings.each do |belonging|
    #   @belonging = Belonging.where(group_id: belonging.group_id)
    #   @belonging.each do |belonging2|
    #     if belonging2.exists(user_id: @user)?
    #       redirect_to user_path(@user.id)
    #     else
    #       render 'index'
    #     end
    #   end
    # end
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
    def get_group
      @belongings = current_user.belongings
      @belongings.each do |belonging|
        @group = Group.find_by(id: belonging.group_id)
      end
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