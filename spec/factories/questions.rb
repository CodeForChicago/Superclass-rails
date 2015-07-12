FactoryGirl.define do
  factory :question do
    title     Faker::Name.title
    body      Faker::Lorem.paragraph
    user
  end
end