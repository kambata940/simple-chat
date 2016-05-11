FactoryGirl.define do
  sequence :email do |n|
    "testuser#{n}@example.com"
  end

  factory :user do
    email
    password 'testpassword'
  end
end

