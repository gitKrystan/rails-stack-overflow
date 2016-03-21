require 'rails_helper'

describe 'The user authentication path' do
  it 'allows a user to log out' do
    user = create(:user)
    login(user)
    click_link 'Sign Out'
    expect(page).to have_content('signed out')
  end
end
