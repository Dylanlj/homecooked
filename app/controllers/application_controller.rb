class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user_location
    puts "====================="
    puts session[:user_address]
    puts "====================="

    session[:user_address]
  end

  helper_method :current_user
  helper_method :current_user_location

  def authorize
    redirect_to '/login' unless current_user
  end

end
