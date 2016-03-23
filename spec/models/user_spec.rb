require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :questions }
  it { should have_many :answers }
  it { should have_secure_password }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_uniqueness_of :email }

  it 'sends an email when the user is created' do
    user = create(:user)
    expect(ActionMailer::Base.deliveries.last.to).to eq [user.email]
  end

  it "sets a user's questions and answers to anonymous " \
     'when they delete their account' do
    user = create(:user, :with_a_question_and_an_answer)
    questions = Array.new(user.questions)
    answers = Array.new(user.answers)
    user.destroy
    anonymous_user = User.find_by name: 'Anonymous'
    expect(user.questions).to eq []
    expect(user.answers).to eq []
    expect(anonymous_user.questions).to eq questions
    expect(anonymous_user.answers).to eq answers
    expect(anonymous_user.questions.first.user.name).to eq 'Anonymous'
  end
end
