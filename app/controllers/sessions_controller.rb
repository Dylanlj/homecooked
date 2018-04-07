class SessionsController < ApplicationController

  def new
  end

  def create
    # Using authentication function with inputs at login screen
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to '/login'
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
