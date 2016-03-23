class User < ActiveRecord::Base
  after_create :send_registration_confirmation
  before_destroy :assign_questions_and_answers_to_anonymous
  has_secure_password
  has_many :questions
  has_many :answers
  validates :name, presence: true, uniqueness: true
  validates :email, uniqueness: true

  private

  def send_registration_confirmation
    UserMailer.registration_confirmation(self).deliver_now
  end

  def assign_questions_and_answers_to_anonymous
    questions_and_answers = questions + answers
    if questions_and_answers.any?
      anonymous_user = User.find_by name: 'Anonymous'
      anonymous_user.questions << questions
      anonymous_user.answers << answers

      questions_and_answers.each do |user_owned_object|
        user_owned_object.update(user: anonymous_user)
      end

      self.questions = []
      self.answers = []
    end
  end
end
