class SessionsController < ApplicationController

  def new
  end

  def create
    # Using authentication function with inputs at login screen
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      session[:user_latitude] = user.latitude
      session[:user_longitude] = user.longitude
      redirect_to root_path
    else
      redirect_to '/login'
    end

  end

  def update
    puts params[:latitude]["change"]
    puts "===================="

    session[:user_latitude] = params[:latitude]["change"]
    session[:user_longitude] = params[:longitude]["change"]
    # if :user_address
    redirect_to root_path
  end


  def destroy
    session[:user_id] = nil
    session[:user_latitude] = 43.644866
    session[:user_longitude] = -79.395176
    redirect_to root_path
  end

end
