# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#(4.months.ago.to_date..Date.current).each do |date|
#  rand(48).times do
#    Provider.create!(created_at: date, rut: Faker::ChileRut.full_rut, name: Faker::Company.name, address: Faker::Address.street_address, phone: Faker::PhoneNumber.phone_number, contact: Faker::Name.name, item: Faker::Company.industry, user_id: 1)
#    Bank.create!(name: Faker::Bank.name, user_id: 1)
#  end
#end

Role.create!(name: "admin")
Role.create!(name: "editor")
