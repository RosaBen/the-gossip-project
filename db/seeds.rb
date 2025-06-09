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
GossipTag.delete_all
City.delete_all
User.delete_all
Gossip.delete_all
Tag.delete_all
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='gossips_tags'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='cities'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='users'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='gossips'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='tags'")

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

puts "Ajouts des gossips"
10.times do 
    Gossip.create!(
        title: Faker::Lorem.sentence(word_count: 1),
        content: Faker::Lorem.paragraph(sentence_count: 2),
        user_id: User.all.sample.id
    )
end


puts "Ajouts des tags"
10.times do 
    Tag.create!(
        title: "#{Faker::Lorem.characters(number: rand(3..10))}"
    )
end

puts "Ajouts de table jointure tag avec gossip"
10.times do
    GossipTag.create!(
        gossip_id: Gossip.all.sample.id,
        tag_id: Tag.all.sample.id
    )
end

puts "Ajouts de messages privés"
10.times do
    PrivateMessage.create!(
        content: Faker::Lorem.characters(number: rand(10..250)),
        # sender_id: User.all.sample.id,
        # recipient_id: User.all.sample.id
    )
end
