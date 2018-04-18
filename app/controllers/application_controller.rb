class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user_latitude
    session[:user_latitude]
  end

  def current_user_longitude
    session[:user_longitude]
  end



  helper_method :current_user
  helper_method :current_user_latitude
  helper_method :current_user_longitude


  def authorize
    redirect_to '/login' unless current_user
  end

end
