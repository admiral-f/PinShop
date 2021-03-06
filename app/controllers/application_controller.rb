class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
    if resource.sign_in_count == 1
       edit_user_registration_path
    else
       root_path
    end
  end

  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :adress, :phone, :first_name, :last_name, :password_confirmation, :nickname, :provider, :url) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :adress, :phone, :first_name, :last_name, :password_confirmation, :current_password, :nickname, :provider, :url) }
  end
end
