class User < ActiveRecord::Base
  after_create :send_registration_confirmation
  has_secure_password
  has_many :questions
  has_many :answers
  validates :name, presence: true, uniqueness: true
  validates :email, uniqueness: true

  private

  def send_registration_confirmation
    UserMailer.registration_confirmation(self).deliver_now
  end
end
