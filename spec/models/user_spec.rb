require 'rails_helper'

RSpec.describe User, type: :model do

  # describe 'Validations' do

  #   it 'must input first_name, last_name, email, password, password_confirmation' do

  #     @user = User.create(first_name: "test", last_name: "user", email: "test@test.com", password: "somestring", password_confirmation: "somestring")

  #     expect(@user.first_name).not_to be(nil)
  #     expect(@user.last_name).not_to be(nil)
  #     expect(@user.email).not_to be(nil)
  #     expect(@user.password).not_to be(nil)
  #     expect(@user.password_confirmation).not_to be(nil)

  #   end

  #   it 'must input :first_name field' do

  #     @user = User.create(first_name: "test")

  #     expect(@user.first_name).not_to be(nil)

  #   end

  #   it 'must input :last_name field' do

  #     @user = User.create(last_name: "user")

  #     expect(@user.last_name).not_to be(nil)

  #   end

  #   it 'must input :email field' do

  #     @user = User.create(email: "test@test.com")

  #     expect(@user.email).not_to be(nil)

  #   end

  #   it 'must have unique email' do

  #     @user1 = User.create(first_name: "test", last_name: "user", email: "TEST@test.com", password: "somestring", password_confirmation: "somestring")
  #     @user2 = User.create(first_name: "test", last_name: "user", email: "anothertest@Test.com", password: "somestring", password_confirmation: "somestring")
  #     @user3 = User.create(first_name: "test", last_name: "user", email: "someothertest@test.COM", password: "somestring", password_confirmation: "somestring")

  #     @emails = User.pluck(:email)
  #     @lower_case_emails = @emails.map(&:downcase)
  #     @input_email = "Newemail@test.com".downcase

  #     expect(@lower_case_emails).not_to include(@input_email)

  #   end

  #   it 'must return error if email exists in the DB' do

  #     @user1 = User.create(first_name: "test", last_name: "user", email: "TEST@test.com", password: "somestring", password_confirmation: "somestring")
  #     @user2 = User.create(first_name: "test1", last_name: "user1", email: "TEST@test.com", password: "somestring1", password_confirmation: "somestring1")

  #     @emails = User.pluck(:email)
  #     @lower_case_emails = @emails.map(&:downcase)
  #     @input_email = "test@test.com".downcase

  #     expect(@lower_case_emails).to include(@input_email)
  #     expect(@user2.errors.full_messages).to include("Email has already been taken")
      
  #   end

  #   it 'must input :password field' do

  #     @user = User.create(password: "somestring")

  #     expect(@user.password).not_to be(nil)

  #   end

  #     it 'password must have a minimum length of 8 characters' do

  #     @user = User.create(first_name: "test", last_name: "user", email: "TEST@test.com", password: "somestring", password_confirmation: "somestring")

  #     expect(@user.password.length).to be > 8

  #   end

  #   it 'must return error if email length is less than 8 characters' do

  #     @user = User.create(first_name: "test", last_name: "user", email: "TEST@test.com", password: "string", password_confirmation: "string")

  #     expect(@user.password.length).to be < 8
  #     expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")

  #   end

  #   it 'must input :password_confirmation field' do

  #     @user = User.create(password_confirmation: "somestring")

  #     expect(@user.password_confirmation).not_to be(nil)

  #   end

  #   it 'must have matching :password and :password_confirmation fields' do

  #     @user = User.create(password: "somestring", password_confirmation: "somestring")

  #     @password_confirmation = @user.password_confirmation
  #     expect(@user.password).to eq(@password_confirmation)

  #   end

  #   it 'returns error if :password and :password_confirmation fields do not match' do

  #     @user = User.create(password: "somestring", password_confirmation: "someotherstring")

  #     expect(@user.password).not_to eq(@user.password_confirmation)
  #     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

  #   end

  # end

  describe '.authenticate_with_credentials' do

    # it 'finds a user by email' do

    #   @user = User.create(first_name: "test", last_name: "user", email: "TEST@test.com", password: "somestring", password_confirmation: "somestring")
    #   logged_in = @user.authenticate_with_credentials("TEST@test.com", "somestring")

    #   expect(logged_in).not_to be(nil)

    # end

    # it 'returns the user when found' do

    #   @user = User.create(first_name: "test", last_name: "user", email: "TEST@test.com", password: "somestring", password_confirmation: "somestring")
    #   logged_in = @user.authenticate_with_credentials("TEST@test.com", "somestring")

    #   expect(logged_in).to eq(@user)

    # end

    # it 'returns nil if user does not exist' do

    #   @user = User.create(first_name: "test", last_name: "user", email: "TEST@test.com", password: "somestring", password_confirmation: "somestring")
    #   logged_in = @user.authenticate_with_credentials("mymail@test.com", "verysecurepassword")

    #   expect(logged_in).not_to eq(@user)
    #   expect(logged_in).to eq(nil)
    # end

    it 'ignores whitespaces and logs in user correctly' do

      @user = User.create(first_name: "test", last_name: "user", email: "TEST@test.com", password: "somestring", password_confirmation: "somestring")
      logged_in = @user.authenticate_with_credentials("  TEST@test.com ", "somestring")

      expect(logged_in).not_to be(nil)

    end

  end
end
