class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!  

  def after_sign_in_path_for(resource)
    users_path
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday])
      devise_parameter_sanitizer.permit(:account_update, keys: [:birthday])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:sex])
      devise_parameter_sanitizer.permit(:account_update, keys: [:sex])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:company])
      devise_parameter_sanitizer.permit(:account_update, keys: [:company])
    end

  private
    def sign_in_required
      redirect_to_new_user_session_url unless user_signed_in?
    end

    def find_user
      @user = User.find(params[:user_id])
    end
end
