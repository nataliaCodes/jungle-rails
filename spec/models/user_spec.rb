require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'has first_name, last_name, email, password, password_confirmation values' do

      user = User.create(first_name: "test", last_name: "user", email: "test@test.com", password: "somestring", password_confirmation: "somestring")

      expect(user.first_name).not_to be(nil)
      expect(user.last_name).not_to be(nil)
      expect(user.email).not_to be(nil)
      expect(user.password).not_to be(nil)
      expect(user.password_confirmation).not_to be(nil)

    end

    it 'has :first_name value' do

      user = User.create(first_name: "test")

      expect(user.first_name).not_to be(nil)

    end

    it 'has :last_name value' do

      user = User.create(last_name: "user")

      expect(user.last_name).not_to be(nil)

    end

    it 'has :email value' do

      user = User.create(email: "test@test.com")

      expect(user.email).not_to be(nil)

    end

    it 'has unique email' do

      user1 = User.create(first_name: "test", last_name: "user", email: "TEST@test.com", password: "somestring", password_confirmation: "somestring")
      user2 = User.create(first_name: "test", last_name: "user", email: "anothertest@Test.com", password: "somestring", password_confirmation: "somestring")
      emails = User.pluck(:email)

      user3 = User.create(first_name: "test", last_name: "user", email: "someothertest@test.COM", password: "somestring", password_confirmation: "somestring")
      input_email = user3.email

      expect(emails).not_to include(input_email)

    end

    it 'returns error if email exists in the DB' do

      user1 = User.create(first_name: "test", last_name: "user", email: "TEST@test.com", password: "somestring", password_confirmation: "somestring")
      user2 = User.create(first_name: "test1", last_name: "user1", email: "test@test.com", password: "somestring1", password_confirmation: "somestring1")

      emails = User.pluck(:email)
      input_email = user2.email

      expect(emails).to include(input_email)
      expect(user2.errors.full_messages).to include("Email has already been taken")
      
    end

    it 'has :password value' do

      user = User.create(password: "somestring")

      expect(user.password).not_to be(nil)

    end

    it 'password must have a minimum length of 8 characters' do

      user = User.create(first_name: "test", last_name: "user", email: "TEST@test.com", password: "somestring", password_confirmation: "somestring")

      expect(user.password.length).to be > 8

    end

    it 'returns error if email length is less than 8 characters' do

      user = User.create(first_name: "test", last_name: "user", email: "TEST@test.com", password: "string", password_confirmation: "string")

      expect(user.password.length).to be < 8
      expect(user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")

    end

    it 'has :password_confirmation value' do

      user = User.create(password_confirmation: "somestring")

      expect(user.password_confirmation).not_to be(nil)

    end

    it 'has matching :password and :password_confirmation values' do

      user = User.create(password: "somestring", password_confirmation: "somestring")

      expect(user.password).to eq(user.password_confirmation)

    end

    it 'returns error if :password and :password_confirmation values do not match' do

      user = User.create(password: "somestring", password_confirmation: "someotherstring")

      expect(user.password).not_to eq(user.password_confirmation)
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")

    end

  end

  describe '.authenticate_with_credentials' do

    it 'finds a user by email' do

      user = User.create(first_name: "test", last_name: "user", email: "TEST@test.com", password: "somestring", password_confirmation: "somestring")
      logged_in = user.authenticate_with_credentials("TEST@test.com", "somestring")

      expect(logged_in).not_to be(nil)

    end

    it 'returns the user when found' do

      user = User.create(first_name: "test", last_name: "user", email: "TEST@test.com", password: "somestring", password_confirmation: "somestring")
      logged_in = user.authenticate_with_credentials("TEST@test.com", "somestring")

      expect(logged_in).to eq(user)

    end

    it 'returns nil if user does not exist' do

      user = User.create(first_name: "test", last_name: "user", email: "TEST@test.com", password: "somestring", password_confirmation: "somestring")
      logged_in = user.authenticate_with_credentials("mymail@test.com", "verysecurepassword")

      expect(logged_in).not_to eq(user)
      expect(logged_in).to eq(nil)
    end

    it 'ignores whitespaces and logs user in correctly' do

      user = User.create(first_name: "test", last_name: "user", email: "TEST@test.com", password: "somestring", password_confirmation: "somestring")
      logged_in = user.authenticate_with_credentials("  TEST@test.com ", "somestring")

      expect(logged_in).not_to be(nil)

    end

    it 'ignores case and logs user in correctly' do

      user = User.create(first_name: "test", last_name: "user", email: "TEST@test.com", password: "somestring", password_confirmation: "somestring")
      logged_in = user.authenticate_with_credentials("test@test.com", "somestring")

      expect(logged_in).not_to be(nil)

    end

  end
end
