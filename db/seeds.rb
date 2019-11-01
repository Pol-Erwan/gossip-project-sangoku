require 'faker'

User.destroy_all
Gossip.destroy_all
Tag.destroy_all
Comment.destroy_all
Like.destroy_all
City.destroy_all
GossipToTag.destroy_all



#create cities
city1 = City.create(name: 'Saint-Malo', zip_code: "35400")
city2 = City.create(name: 'Angers', zip_code: "49000")
city3 = City.create(name: 'Paris', zip_code: "75000")
city4 = City.create(name: 'Avrillé', zip_code: "49240")
puts "4 cities created"



10.times do
  #create user
  city = [city1, city2, city3, city4].sample
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10, supplemental: true), email: Faker::Internet.email, age: rand(18..80), city_id: city.id,  password: 'password')
 
  #assign city to user


  #create gossip
  gossip1 = Gossip.create(title: Faker::Game.title, content: Faker::Lorem.sentence(word_count: 120, supplemental: true), user_id: user.id)
  gossip2 = Gossip.create(title: Faker::Game.title, content: Faker::Lorem.sentence(word_count: 120, supplemental: true), user_id: user.id)
 #assign gossips to user
  
  #create tags
  tag = Tag.create(title: "##{Faker::Verb.base}")
  tag.save
  #assign tags to user
  gossip1.tags << tag
  gossip2.tags << tag
  #create comments
  comment1 = Comment.new(gossip_id: gossip1.id, content: Faker::Lorem.sentence(word_count: 10, supplemental: true))
  comment2 = Comment.new(gossip_id: gossip2.id, content: Faker::Lorem.sentence(word_count: 10, supplemental: true))
  #assign comments to user
  user.comments << comment1
  user.comments << comment2
  
  #like randomly comment1 or comment2
  if rand(0..1) == 0
  like1 = Like.create(user_id: user.id, gossip_id: gossip1.id) #like gossip
  else
  like1 = Like.create(user_id: user.id, comment_id: comment1.id) #like comment
  end

    #like randomly gossip1 or gossip2
  if rand(0..1) == 0
    like1 = Like.create(user_id: user.id, gossip_id: gossip2.id) #like gossip
    else
    like1 = Like.create(user_id: user.id, comment_id: comment2.id) #like comment
    end
  
  user.save

end
puts "10 users created"
puts "10 cities created"
puts "20 gossips created"
puts "10 tags created"
puts "20 comments created"
puts "20 random likes created"
puts "All values has been created!"
