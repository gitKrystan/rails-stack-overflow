require 'rails_helper'

describe 'the answer a question path' do
  before :each do
    @question = create(:question)
  end

  it 'only allows logged in users to answer questions' do
    visit new_question_answer_path(@question)
    expect(page).to have_content("Please Log In")
  end

  it 'creates an answer when content is filled in' do
    login(create(:user))
    visit question_path(@question)
    click_link "Answer this Question"
    fill_in :answer_content, with: "test answer"
    click_button "Submit Answer"
    expect(page).to have_content("test answer")
  end

  it 'shows an error if the answer form is improperly filled in' do
    login(create(:user))
    question = create(:question)
    visit new_question_answer_path(question)
    click_button "Submit Answer"
    expect(page).to have_content("error")
  end
end
