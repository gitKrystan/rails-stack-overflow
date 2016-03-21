require 'rails_helper'

describe 'the create a question path' do
  it 'only allows logged in users to create questions' do
    visit new_question_path
    expect(page).to have_content("Please Log In")
  end

  it 'creates a question when content is filled in' do
    login(create(:user))
    visit root_path
    click_link "Ask a Question"
    fill_in :question_content, with: "test question?"
    click_button "Ask the Internet"
    expect(page).to have_content("test question?")
  end
end
