# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## creating users data and question data
5.times do
  Topic.create!(name: Faker::Name.name)
end
topics = Topic.all
10.times do
  User.create!(email: Faker::Internet.email, password: '12345678')
end

users = User.all
users.each do |user|
  5.times do
    topics.each do |topic|
      user.questions.create!(title: Faker::Lorem.sentence(word_count: 5), topic_id: topic.id)
    end
  end
end

## adding dummy answer data
questions = Question.all
questions.each do |question|
  10.times do
    question.answers.create!(content: Faker::Lorem.sentence(word_count: 5))
  end
end

