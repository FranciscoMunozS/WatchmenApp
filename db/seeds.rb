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

Bank.create!(name: 'Banco Estado', user_id: 1)
Bank.create!(name: 'Banco Santander', user_id: 1)
Bank.create!(name: 'Banco Corpbanca', user_id: 1)
Bank.create!(name: 'Banco Falabella', user_id: 1)
Bank.create!(name: 'Banco de Chile', user_id: 1)
Bank.create!(name: 'Banco BICE', user_id: 1)
Bank.create!(name: 'Banco Scotiabank', user_id: 1)
Bank.create!(name: 'Banco Internacional', user_id: 1)
Bank.create!(name: 'Banco ITAU', user_id: 1)
Bank.create!(name: 'Banco Security', user_id: 1)
Bank.create!(name: 'Banco Proaval', user_id: 1)
Bank.create!(name: 'Banco Credito e Inversiones', user_id: 1)
Bank.create!(name: 'Banco HDI', user_id: 1)
Bank.create!(name: 'Banco Consorcio', user_id: 1)
Bank.create!(name: 'Banco First Aval', user_id: 1)
