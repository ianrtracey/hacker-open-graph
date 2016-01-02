class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_filter :authenticate_user!

  def dashboard
  end

  protected
  def authenticate_user!
  	redirect_to root_path, notice: "You must login" unless user_signed_in?
  end
end
