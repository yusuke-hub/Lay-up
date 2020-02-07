class UsersController < ApplicationController
  def index
    @belonging = Belonging.new
    @search = User.search(params[:q])
      if params[:q]
        @results = @search.result(distinct: true).page(params[:page])
      else
        @results = User.all.page(params[:page])
      end
  end
  def show
      @user = User.find(params[:id])
      check_flg = false
      if current_user.belongings.blank?
        check_flg = true
      end      
      current_user.belongings.each do |belonging|
        @belongings = Belonging.where(group_id: belonging.group_id)
          if @belongings.exists?(user_id: @user.id)
            check_flg = true
          end
      end
      if check_flg == false
        redirect_to users_path
      end
  end
  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(@user.id)
    end
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to root_path
    end
  end
  private
    def user_params
    	params.require(:user).permit(:email,:name,:account_id,:profile_image,:phone_number)
    end
end