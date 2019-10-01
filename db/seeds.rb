10.times do |user|
  name = Faker::Name.first_name
  email = Faker::Internet.safe_email(name: name)
  password = "testtest"
  User.create!(name: name, 
              email: email, 
              password: password, 
              avatar: nil)
end

15.times do |feed|
  content = Faker::Lorem.paragraph(sentence_count: 2)
  image ="http://placehold.it/500x400"
  Feed.create!(content: content,
              image: image,
              user_id: rand(1..10))
end

40.times do |comment|
  content = Faker::Lorem.paragraph(sentence_count: 2)
  Comment.create!(content: content,
                  feed_id: rand(1..15),
                  user_id: rand(1..10))
end
