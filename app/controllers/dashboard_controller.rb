class DashboardController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  
  def dashboard_v1
    @hackers = Hacker.all
    @account = current_user.account
    @num_resumes = @hackers.select { |x| !x.resume.nil? }.count
    @num_job_seekers = @hackers.select { |x| x.hireable }.count
  end
  def dashboard_v2
  end
  def dashboard_v3
  end
  # set another layout for a specific action
  def dashboard_h
    render :layout => 'application-h'
  end

end
