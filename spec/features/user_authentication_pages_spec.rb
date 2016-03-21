require 'rails_helper'

describe 'The user authentication path' do
  before :each do
    @user = create(:user)
  end

  it 'allows a user to log out' do
    login(@user)
    click_link 'Sign Out'
    expect(page).to have_content('signed out')
  end

  it 'doesnt allow a user to login with improper credentials' do
    incorrect_credentials = build(:user, password: 'wrong password')
    login(incorrect_credentials)
    expect(page).to have_content('invalid')
  end
end
