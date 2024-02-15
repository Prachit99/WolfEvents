class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_admin
  before_action :authorized
  helper_method :logged_in?


  def current_admin
    if session[:id]
      @current_admin ||= Admin.find(session[:id])
    else
      @current_admin = nil
    end
  end

  def current_user
    if session[:id]
      @current_user ||= Attendee.find(session[:id])
    else
      @current_user = nil
    end
  end
  def logged_in?
    !current_admin.nil? || !current_user.nil?
  end

  def authorized
    redirect_to root_path unless logged_in?
  end
end
