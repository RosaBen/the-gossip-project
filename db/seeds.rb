require "faker"

puts "🔄 Nettoyage des données..."

Gossip.delete_all
Author.delete_all if defined?(Author) # facultatif
User.delete_all
City.delete_all

ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='cities'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='users'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='gossips'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='authors'") rescue nil

puts "🏙️ Ajout des villes"
10.times do
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Number.number(digits: 5)
  )
end

puts "👤 Ajout des utilisateurs"
10.times do
  User.create!(
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    email: Faker::Internet.unique.email,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    age: rand(18..100),
    city: City.all.sample,
    password: "password", # requis par Devise
    password_confirmation: "password"
  )
end

puts "🗞️ Ajout des gossips"
10.times do
  Gossip.create!(
    title: Faker::Lorem.sentence(word_count: 2),
    content: Faker::Lorem.paragraph(sentence_count: 2),
    user: User.all.sample
  )
end

puts "✍️ Ajouts des auteurs (facultatif)"
Author.create!(first_name: "Anonymous", last_name: "") if defined?(Author)
10.times do
  Author.create!(
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name
  ) if defined?(Author)
end

puts "✅ Seeds terminés !"
