require 'rails_helper'

describe 'the admin namespace' do
  it 'does not allow non-admins to admin routes' do
    login(create(:user))
    visit admin_root_path
    expect(page).to have_content('Please Log In')
  end
end

describe 'the add an admin user path' do
  before :each do
    user = create(:user)
    login(create(:admin_user))
    visit admin_root_path
    click_link user.name
  end

  it "allows an admin to add and remove another user's admin status" do
    click_button 'Make Admin'
    expect(page).to have_button('Remove as Admin')
    click_button('Remove as Admin')
    expect(page).to have_button('Make Admin')
  end

  it 'allows an admin to delete a user', js: true do
    click_button 'Delete User'
    # accept_confirm do
    #   click_on 'ok'
    # end
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('User has been deleted.')
  end
end
