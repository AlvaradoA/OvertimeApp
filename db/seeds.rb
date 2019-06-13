@user = User.create(email: "email@email.com", password: "password", password_confirmation: "password", first_name: "fname", last_name: "lname")

puts "1 user created"
100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 Posts have been created"
