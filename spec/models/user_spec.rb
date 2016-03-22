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
end
