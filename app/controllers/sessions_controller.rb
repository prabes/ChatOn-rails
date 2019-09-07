class SessionsController < ApplicationController
  
  def new 
    if logged_in?
      redirect_to root_path
    end
  end

  def create

    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in."
      redirect_to root_path 
    else
      flash.now[:error] = "Something is wrong with login information"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You've sucessfully logged out."
    redirect_to login_path
  end

end
