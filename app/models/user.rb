class User < ActiveRecord::Base

  has_secure_password

  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation
  validates_uniqueness_of :email
  validates_length_of :password, minimum: 8

  def authenticate_with_credentials(email, password)

    formatted_email = email.strip

    @user = User.find_by_email(formatted_email)

    #user exists and the password matches
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
    
  end
  
end