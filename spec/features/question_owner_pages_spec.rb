require 'rails_helper'

describe 'the manage a question path' do
  before :each do
    @question = create :user_question, :with_two_answers
  end

  it 'allows the question owner to mark and change a best answer' do
    login(@question.user)
    visit question_path(@question)
    expect(page).not_to have_content('Best Answer!')
    click_button('Mark as Best Answer', match: :first)
    expect(page).to have_content('Best Answer!')
    # Change the best answer and expect that there is only one best answer
    # Thus, the first best answer still appears because it is no longer the best
    click_button('Mark as Best Answer')
    expect(page).to have_button('Mark as Best Answer', count: 1)
    click_button('Remove as Best Answer')
    expect(page).not_to have_content('Best Answer!')
  end

  it 'does not allow another user to manage the question' do
    login(create(:user))
    visit question_path(@question)
    expect(page).to have_content(@question.content)
    expect(page).not_to have_button('Mark as Best Answer')
  end
end
