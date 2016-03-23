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
    # TODO: this stopped working?
  end

  def assign_questions_and_answers_to_anonymous
    questions_to_transfer = self.questions
    answers_to_transfer = self.answers

    questions_and_answers = questions_to_transfer + answers_to_transfer
    if questions_and_answers.any?
      # TODO: make a secret seed anonymous user
      anonymous_user = User.find_by name: 'Anonymous'
      anonymous_user ||= User.create(name: 'Anonymous',
                                  email: 'anonymous@example.com',
                                  password: 'test')
      anonymous_user.questions << questions_to_transfer
      anonymous_user.answers << answers_to_transfer

      questions_and_answers.each do |user_owned_object|
        user_owned_object.update(user: anonymous_user)
      end

      self.questions = []
      self.answers = []
    end
  end
end
