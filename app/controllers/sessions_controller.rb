class SessionsController < ApplicationController
include SessionsHelper
  
def new
  end
 

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in user
      params[:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = 'Log in successful'
      redirect_to gossips_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render new_session_path
    end
  end

  def destroy
    log_out if current_user
    flash[:success] = 'Log out successful'
    redirect_to root_url
  end


end
