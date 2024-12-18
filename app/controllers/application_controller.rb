class ApplicationController < ActionController::Base
    before_action :set_application_name 
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?


    def after_sign_in_path_for(resource)
        home_index_path
    end

#   time_from_params = Time.parse(self.time).change(sec: 0, usec: 0)
#   current_time = Time.now.change(sec: 0, usec: 0)


    protected

    def set_application_name
        @app_name = "Task Reminder"
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :account_id,  :email, :password)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :account_id, :email, :password, :current_password)}
    end

end
