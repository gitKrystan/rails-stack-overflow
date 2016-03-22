require 'rails_helper'

describe 'the admin namespace' do
  it 'does not allow non-admins to admin routes' do
    login(create(:user))
    visit admin_root_path
    expect(page).to have_content("Please Log In")
  end
end

describe 'the add an admin user path' do
  before :each do
    @user = create(:user)
    login(create(:admin_user))
  end

  it "allows an admin to add and remove another user's admin status" do
    visit admin_root_path
    click_link @user.name
    click_button 'Make Admin'
    expect(page).to have_button('Remove as Admin')
    click_button('Remove as Admin')
    expect(page).to have_button('Make Admin')
  end
end
