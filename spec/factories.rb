FactoryGirl.define do
  factory :user do
    name      'test_user'
    email     'test@test.com'
    password  'qwerty'
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
    question
    sequence :content do |n|
      "test answer #{n}"
    end
  end
end
