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
    # @belongings = Belonging.where(user_id: current_user.id)
    # @belongings.each do |belonging|
    #   @mygroup = belonging.group_id
    # @groups = Group.where(id: @belongings)
    # @groups.each do |group|
    #   @member_id = group.user_ids
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
end
