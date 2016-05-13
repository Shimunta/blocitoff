#Create users

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: "password"
  )

end
  users = User.all

#create lists
10.times do
  Item.create!(
    user: users.sample,
    name: Faker::Book.title
  )
end

puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
