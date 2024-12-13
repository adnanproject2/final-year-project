class ApplicationController < ActionController::Base
    before_action :set_application_name 
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    def set_application_name
        @app_name = "Task Reminder"
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password)}
    end

end
