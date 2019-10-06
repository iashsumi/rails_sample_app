class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :authenticate_administrator!         
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:login_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:login_id])
  end

  private

  def after_sign_in_path_for(resource)
    '/users'
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end
end
