class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def dashboard
  end

  protected
  def authenticate_user!
    if user_signed_in?
      super
    else
  	  redirect_to login_path, notice: "You must login"
    end
  end
end
