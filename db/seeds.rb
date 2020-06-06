# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
months = ['Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
times = ['12:00pm','1:00pm', '2:00pm', '3:00pm', '4:00pm', '5:00pm', '12:30pm','1:30pm', '2:30pm', '3:30pm', '4:30pm', '5:30pm']

5.times do
  trip = Trip.create(
    name: Faker::Creature::Cat.name,
    start_date: Faker::Date.forward(days: 1),  
    end_date: Faker::Date.forward(days: 5)
  )
  10.times do
    location = Location.create(
      name: Faker::Nation.capital_city,
      days: Faker::Number.number(digits: 2),
      trip_id: trip.id
    )
    Address.create(
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip: Faker::Address.zip_code,
      location_id: location.id
    )
  end
end

    puts "Data Seeded."