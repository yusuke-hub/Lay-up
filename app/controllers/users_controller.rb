class UsersController < ApplicationController
  def index
    @users1 = User.all
    # @q = User.ransack(params[:q])
    # @users2 = @q.result(distinct: true)
    # @group = Group.new
    # @Group.add_user_to＿groups.build
  end

  def show
  end

  def edit
  end
end
