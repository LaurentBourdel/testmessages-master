require 'faker'

# Sets the local to "England":
Faker::Config.locale = 'en'

Event.destroy_all
Attendance.destroy_all
User.destroy_all

# seed user
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: Faker::Name.first_name + "#{rand(9999)}@yopmail.com", #Faker::Internet.email,
    password: Faker::Lorem.characters(number: 6)
  )
end

# seed Event
10.times do
  Event.create!(
    title: Faker::Lorem.sentence(word_count: 3, supplemental: false),
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: true),
    start_date: Faker::Date.forward,
    duration: rand(1..30)*5,
    price: rand(1..1000),
    location: Faker::Address.community
  )
end

# seed Attendance
10.times do
  Attendance.create!(
    user: User.all.sample,
    event: Event.all.sample,
    stripe_customer_id: Faker::Number.unique.number
  )
end