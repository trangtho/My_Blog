# class ApplicationController < ActionController::Base
class ApplicationController < ActionController::API
  include Response
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:user, keys: [:username, :email, :password, :role])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :role])
  end

end
