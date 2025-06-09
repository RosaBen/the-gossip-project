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
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='cities'")

puts "Ajout des villes..."
10.times do
    City.create!(
        name: Faker::Address.city,
        zip_code: Faker::Number.number(digits: 5)
    )
end