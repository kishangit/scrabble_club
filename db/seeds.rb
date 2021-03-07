# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.first_name            = 'Kishan'
u.last_name             = 'Dalwadi'
u.join_date             = Date.current
u.phone                 = '1234567890'
u.email                 = 'dalwadikishan123@gmail.com'
u.password              = 'password'
u.password_confirmation = 'password'
u.is_administrator      = true
u.save

50.times do
  u = User.new
  u.first_name            = Faker::Name.first_name
  u.last_name             = Faker::Name.last_name
  u.join_date             = Faker::Date.between(from: 100.days.ago, to: 10.days.ago)
  u.phone                 = Faker::PhoneNumber.cell_phone_in_e164
  u.email                 = Faker::Internet.email
  u.password              = 'password'
  u.password_confirmation = 'password'
  u.save
end

500.times do
  m = Match.new
  m.player_one = ([*User.first.id..User.last.id]).sample
  m.player_two = ([*User.first.id..User.last.id] - [m.player_one]).sample
  m.player_one_score = ([*0..90]).sample
  m.player_two_score = ([*0..100] - [m.player_one_score]).sample
  m.winner = m.player_one_score > m.player_two_score ? m.player_one : m.player_two
  m.loser = m.player_one_score > m.player_two_score ? m.player_two : m.player_one
  m.place = Faker::Address.city
  m.created_at = Faker::Date.between(from: 9.days.ago, to: 1.days.ago)
  m.save
end

50.times do |i|
  i = i +1
  user = User.find(i)
  all_matches = [
    Match.where("player_one = ? ", user.id).pluck(:player_one_score), 
    Match.where("player_two = ? ", user.id).pluck(:player_two_score)
  ].flatten
  highest_score = all_matches.max
  user.highest_score = highest_score
  user.total_matches = Match.where("player_one = ? or player_two = ?", user.id, user.id).count
  user.save
end