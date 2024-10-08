class ApplicationController < ActionController::Base
  before_action:configure_permitted_parameters,if: :devise_controller?
  before_action :authenticate_user!,except:[:top, :about]
  before_action :is_matching_login_user, only: [:edit, :update]


  def after_sign_up_path_for(resource)
    user_path(resource.id)
  end

  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  def after_sign_out_path_for(resource)
    "/"
  end

  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end
end
