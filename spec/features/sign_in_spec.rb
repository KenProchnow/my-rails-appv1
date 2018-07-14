require 'rails_helper'
require 'factory_girl_rails'

feature 'sign into the app' do
  # let is lazy, it simply replaces before() not sure why you'd use it.
  # let(:user) {FactoryGirl.create(:user)}
  setup do
    @user = FactoryGirl.create(:user)
  end

  # rspec spec/features/sign_in_spec.rb
  scenario 'log in' do
    visit('/')
    # click_link "Sign Up!"
    click_link "Login"
    fill_in('user[email]', with: @user.email)
    fill_in('user[password]', with: @user.password)
    click_button "Log in"
    expect(page).to have_content("Signed in successfully")
  end

  scenario 'sign up' do
    visit('/')
    click_link "Sign up!"
    fill_in('user[email]', with: "someone@gmail.com")
    fill_in('user[password]', with: "password123")
    fill_in('user[password_confirmation]', with: "password123")
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end


  # scenario 'sign up' do
    # visit('/')
    # click_on('Sign Up!')
    # fill_in('Email:', with: 'kenprochnow@gmail.com')
    # fill_in('Password:', with: 'password')
    # fill_in('Password Confirmation:', with: 'password')
    # select()
    # check()
  # end
end