# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Question.destroy_all
User.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('questions')

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