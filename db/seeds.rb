# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

puts "Nettoyage des données..."
City.delete_all
User.delete_all
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='cities'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='users'")

puts "Ajout des villes"
10.times do
    City.create!(
        name: Faker::Address.city,
        zip_code: Faker::Number.number(digits: 5)
    )
end

puts "Ajout des utilisateurs"
10.times do
    User.create!(
        last_name: Faker::Name.last_name,
        first_name: Faker::Name.first_name,
        email: Faker::Internet.unique.email,
        description: Faker::Lorem.paragraph(sentence_count: 3),
        age: rand(18..100),
        city_id: City.all.sample.id
    )
end