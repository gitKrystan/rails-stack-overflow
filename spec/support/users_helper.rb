module UserHelper
  def login(user)
    visit root_path
    click_link 'Sign In'
    fill_in :name, with: user.name
    fill_in :password, with: user.password
    click_button 'Complete Sign In'
  end
end
