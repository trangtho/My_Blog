class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:user, keys: [:username, :email, :password, :role])
    end

end
