module V1
  FactoryGirl.define do
    factory :user do
      username Faker::Internet.user_name
      password Faker::Internet.password(8,16)
      sequence(:email) { |n| "person#{n}@example.com" }
      after(:build) { |user|
        user.update_access_token!
      }
    end
  end
end
