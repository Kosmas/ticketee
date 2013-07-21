class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private

    def require_signin!
      unless session[:user_id].present?
        flash[:alert] = "You need to sign in or sign up before continuing."
        redirect_to signin_path
      end
    end

    def authorize_admin!
      require_signin!
      unless current_user.admin?
        flash[:alert] = "You must be an admin to do that."
        redirect_to root_path
      end 
    end
end