# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'

10.times do
  Lesson.create(summary: Faker::Lorem.paragraph, title: Faker::Name.title, creator: "CFC", link: "codeacademy.com")
  u = User.create(email: Faker::Internet.email, username: Faker::Internet.user_name, password: 'password')
  q = Question.create(user: u, body: Faker::Lorem.paragraph, title: Faker::Name.title)

  Comment.create(body: Faker::Lorem.paragraph, user: u, question: q )
end
User.create(email: "user@user.com", username: 'user', password: 'password')
User.create(email: "admin@admin.com", username: 'admin', password: 'password', role: 'admin')



