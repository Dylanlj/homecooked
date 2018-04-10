class SessionsController < ApplicationController

  def new
  end

  def create
    # Using authentication function with inputs at login screen
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      session[:user_address] = user.address
      redirect_to root_path
    else
      redirect_to '/login'
    end

  end

  def update
    session[:user_address] = params[:address]
    redirect_to root_path
  end


  def destroy
    session[:user_id] = nil
    session[:user_address] = nil
    redirect_to '/login'
  end

end
