class ApplicationController < ActionController::Base
  #protect_from_forgery except: :sign_out
  
  # protect_from_forgery with: :null_session
  protect_from_forgery with: :null_session, only: [:create]
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  


        protected

        def configure_permitted_parameters
          added_attrs = [:username, :email, :password, :password_confirmation, :remember_me,:fullname,:role_id]
          devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
          devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
          devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        end

        
      end
