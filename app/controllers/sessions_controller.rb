class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])
    
    if user

      #create cookie and redirect to homepage
      session[:user_id] = user.id
      redirect_to '/'

    else

      redirect_to '/login'

    end

  end

  def destroy

    #delete cookie
    session[:user_id] = nil
    redirect_to '/login'
    
  end

end
