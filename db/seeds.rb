@user = User.create(email: "email@email.com", password: "password", password_confirmation: "password", first_name: "fname", last_name: "lname")

puts "1 user created"

AdminUser.create(email: "admin@email.com", password: "password", password_confirmation: "password", first_name: "Admin", last_name: "User")

puts "1 admin user created"


100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 Posts have been created"
