require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should belong_to :user }
  it { should have_many :answers }
  it { should validate_presence_of :content }

  describe '#count_today' do
    it 'returns the number of questions from today' do
      create :question
      expect(Question.count_today).to eq 1
    end
  end
end
