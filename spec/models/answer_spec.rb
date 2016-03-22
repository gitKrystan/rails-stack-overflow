require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should belong_to :user }
  it { should belong_to :question }
  it { should validate_presence_of :content }

  describe '#count_today' do
    it 'returns the number of answers from today' do
      create :answer
      expect(Answer.count_today).to eq 1
    end
  end
end
