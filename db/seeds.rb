# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Like.destroy_all
Answer.destroy_all
Question.destroy_all
User.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('questions')
ActiveRecord::Base.connection.reset_pk_sequence!('answers')
ActiveRecord::Base.connection.reset_pk_sequence!('likes')

user1 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user2 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user3 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user4 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user5 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user6 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user7 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user8 = User.create(username: Faker::Name.name, email: Faker::Internet.email)
user9 = User.create(username: Faker::Name.name, email: Faker::Internet.email)

question1 = Question.create(subject: Faker::ProgrammingLanguage.name, body: Faker::Lorem.sentence, user_id: user1.id)
question2 = Question.create(subject: Faker::ProgrammingLanguage.name, body: Faker::Lorem.sentence, user_id: user1.id)
question3 = Question.create(subject: Faker::ProgrammingLanguage.name, body: Faker::Lorem.sentence, user_id: user1.id)
question4 = Question.create(subject: Faker::ProgrammingLanguage.name, body: Faker::Lorem.sentence, user_id: user2.id)
question5 = Question.create(subject: Faker::ProgrammingLanguage.name, body: Faker::Lorem.sentence, user_id: user2.id)
question6 = Question.create(subject: Faker::ProgrammingLanguage.name, body: Faker::Lorem.sentence, user_id: user2.id)

answer1 = Answer.create(body: Faker::Hacker.say_something_smart, user_id: user3.id, question_id: question1.id)
answer2 = Answer.create(body: Faker::Hacker.say_something_smart, user_id: user3.id, question_id: question2.id)
answer3 = Answer.create(body: Faker::Hacker.say_something_smart, user_id: user3.id, question_id: question3.id)
answer4 = Answer.create(body: Faker::Hacker.say_something_smart, user_id: user4.id, question_id: question1.id)
answer5 = Answer.create(body: Faker::Hacker.say_something_smart, user_id: user4.id, question_id: question4.id)
answer6 = Answer.create(body: Faker::Hacker.say_something_smart, user_id: user4.id, question_id: question5.id)

Like.create(user_id: user3.id, answer_id: answer1.id)
Like.create(user_id: user4.id, answer_id: answer2.id)
Like.create(user_id: user5.id, answer_id: answer3.id)
Like.create(user_id: user3.id, answer_id: answer3.id)
Like.create(user_id: user4.id, answer_id: answer1.id)
Like.create(user_id: user5.id, answer_id: answer2.id)