class User < ActiveRecord::Base

  has_secure_password

  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation
  validates_uniqueness_of :email
  validates_length_of :password, minimum: 8

  before_save { email.downcase! }

  def self.authenticate_with_credentials(email, password)

    formatted_email = email.strip.downcase

    user = self.find_by_email(formatted_email)

    #user exists and the password matches
    if user && user.authenticate(password)
      user
    else
      nil
    end
    
  end
  
end