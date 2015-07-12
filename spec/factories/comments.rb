FactoryGirl.define do
  factory :comment do
    body    Faker::Lorem.paragraph
    user
    question
  end

end
