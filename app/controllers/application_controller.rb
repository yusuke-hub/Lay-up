class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:create, :top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_invitation
  def after_sign_in_path_for(resource)
  	root_path
  end
  def after_sign_out_path_for(resource)
    new_user_session_path
  end
  def check_invitation
    if user_signed_in?
      @belongings = current_user.belongings
      @invited_group = @belongings.where(activation: false)
    end
  end    
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :account_id,:phone_number])
  end
end
