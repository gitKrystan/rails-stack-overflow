FactoryGirl.define do
  factory :user do
    sequence :name do |n|
      "test_user_#{n}"
    end
    sequence :email do |n|
      "test#{n}@example.com"
    end
    password 'qwerty'

    factory :admin_user do
      admin true
    end
  end

  factory :question do
    sequence :content do |n|
      "test question #{n}"
    end

    factory :user_question do
      user
    end
  end

  factory :answer do
    sequence :content do |n|
      "test answer #{n}"
    end
  end

  trait :with_two_answers do
    after :create do |question|
      create_list :answer, 2, question: question
    end
  end

  trait :with_a_question_and_an_answer do
    after :create do |user|
      create :question, user: user
      create :answer, user: user
    end
  end
end
