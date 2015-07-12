module V1
  FactoryGirl.define do
    factory :lesson do
      creator   Faker::Company.name
      title     Faker::Name.title
      link      Faker::Internet.url
      summary   Faker::Lorem.paragraph
    end
  end
end


