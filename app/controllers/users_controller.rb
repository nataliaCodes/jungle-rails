class UsersController < ApplicationController

  def new
  end

  def create

    @emails = User.pluck(:email)
    @lower_case_emails = @emails.map(&:downcase)

    if @lower_case_emails.include?(user_params[:email])
      @user.errors.add :email "Email is in use"
    else
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/signup'
      end
    end

  end  

  private
  def user_params
    params.require(:user).permit(
      :first_name, 
      :last_name, 
      :email, 
      :password, 
      :password_confirmation
    )
  end

end
