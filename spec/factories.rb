FactoryGirl.define do
  factory :user do
    name      'test_user'
    email     'test@test.com'
    password  'qwerty'
  end

  factory :question do
    content "test question"
  end
end
