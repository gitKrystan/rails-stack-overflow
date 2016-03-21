require 'rails_helper'

describe 'The new user path' do
  it 'creates a new user when all required fields are present' do
    userAttrs = attributes_for(:user)
    visit root_path
    click_link 'Sign Up'
    fill_in :user_name, with: userAttrs[:name]
    fill_in :user_email, with: userAttrs[:email]
    fill_in :user_password, with: userAttrs[:password]
    fill_in :user_password_confirmation, with: userAttrs[:password]
    click_button 'Complete Sign Up'
    expect(page).to have_content(userAttrs[:name])
  end

  it 'gives an error message when a required field is not filled in' do
    visit signup_users_path
    click_button 'Complete Sign Up'
    expect(page).to have_content('errors')
  end
end
