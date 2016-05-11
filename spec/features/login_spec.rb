require 'rails_helper'

feature 'Authentication', js: true do
  describe 'successful sign up' do
    it 'create new user' do
      user = build(:user)
      visit 'users/sign_up'
      fill_in 'email', with: user.email
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password
      click_button 'Sign up'
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
  end

  describe 'unsuccessful sign up' do
    it 'fail to create new user with invalid creditensials' do
      visit 'users/sign_up'
      fill_in 'email', with: '1.example.com'
      fill_in 'user_password', with: 'g1'
      fill_in 'user_password_confirmation', with: 'g2'
      click_button 'Sign up'
      expect(page).to have_content "3 errors prohibited this user from being saved: Email is invalid
                                    Password confirmation doesn't match
                                    Password Password is too short (minimum is 6 characters)"
    end
  end
end
