class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    
    #user exists AND password is correct
    if user && user.authenticate(params[:password])

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
