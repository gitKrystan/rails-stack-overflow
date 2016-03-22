require 'rails_helper'

describe 'the manage a question path' do
  before :each do
    @question = create :user_question, :with_answers
  end

  it 'allows the question owner to manage the question' do
    login(@question.user)
    visit question_path(@question)
    expect(page).to have_button('Mark as Best Answer')
  end

  it 'does not allow another user to manage the question' do
    login(create(:user))
    visit question_path(@question)
    expect(page).to have_content(@question.content)
    expect(page).not_to have_button('Mark as Best Answer')
  end
end
