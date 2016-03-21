require "rails_helper"

describe 'the view a question path' do
  it 'allows a user to view a question' do
    question = create(:question)
    visit root_path
    click_link question.content
    expect(page).to have_content(question.content)
    expect(page).to have_content("Answer this Question")
  end
end
