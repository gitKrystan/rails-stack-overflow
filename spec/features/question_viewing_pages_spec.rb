require "rails_helper"

describe 'the view a question path' do
  it 'allows a user to view a question' do
    question = create(:question)
    visit root_path
    click_link question.content
    expect(page).to have_content(question.content)
    expect(page).to have_content("Answer this Question")
  end

  it 'shows the number of questions and answers for the day on the index' do
    create :question, :with_two_answers
    visit root_path
    expect(page).to have_content('Questions: 1')
    expect(page).to have_content('Answers: 2')
  end
end
