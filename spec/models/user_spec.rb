require 'rails_helper'

RSpec.describe User, type: :model do

  # describe 'Validations: ' do

  #   it 'must have first_name, last_name, email, password, password_confirmation fields' do

  #     @user = User.create(first_name: "test", last_name: "user", email: "test@test.com", password: "somestring", password_confirmation: "somestring")

  #     expect(@user.first_name).not_to be(nil)
  #     expect(@user.last_name).not_to be(nil)
  #     expect(@user.email).not_to be(nil)
  #     expect(@user.password).not_to be(nil)
  #     expect(@user.password_confirmation).not_to be(nil)

  #   end

  #   it 'must have :first_name field' do

  #     @user = User.create(first_name: "test")

  #     expect(@user.first_name).not_to be(nil)

  #   end

  #   it 'must have :last_name field' do

  #     @user = User.create(last_name: "user")

  #     expect(@user.last_name).not_to be(nil)

  #   end

  #   it 'must have :email field' do

  #     @user = User.create(email: "test@test.com")

  #     expect(@user.email).not_to be(nil)

  #   end

  #   it 'must have :password field' do

  #     @user = User.create(password: "somestring")

  #     expect(@user.password).not_to be(nil)

  #   end

  #   it 'must have :password_confirmation field' do

  #     @user = User.create(password_confirmation: "somestring")

  #     expect(@user.password_confirmation).not_to be(nil)

  #   end

  # end

  describe 'New user' do

    # it 'must have matching :password and :password_confirmation fields' do

    #   @user = User.create(password: "somestring", password_confirmation: "somestring")

    #   @password_confirmation = @user.password_confirmation
    #   expect(@user.password).to eq(@password_confirmation)

    # end

    # it 'returns error if :password and :password_confirmation fields do not match' do

    #   @user = User.create(password: "somestring", password_confirmation: "someotherstring")

    #   @password_confirmation = @user.password_confirmation
    #   expect(@user.password).not_to eq(@password_confirmation)
    #   expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

    # end

    it 'must have unique email' do

      @user1 = User.create(first_name: "test", last_name: "user", email: "TEST@test.com", password: "somestring", password_confirmation: "somestring")
      @user2 = User.create(first_name: "test", last_name: "user", email: "anothertest@Test.com", password: "somestring", password_confirmation: "somestring")
      @user3 = User.create(first_name: "test", last_name: "user", email: "someothertest@test.COM", password: "somestring", password_confirmation: "somestring")

      @emails = User.pluck(:email)
      @lower_case_emails = @emails.map(&:downcase)
      @input_email = "Newemail@test.com".downcase

      expect(@lower_case_emails).not_to include(@input_email)

    end

    # it 'must return error if email exists in the DB' do

    #   @user = User.create(email: "test@test.com")
    #   @input_email = "test@test.com"
      
    # end

    # it 'password must have a minimum length of 8 characters' do

    # end

  end
end
