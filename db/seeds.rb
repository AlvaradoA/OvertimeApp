AdminUser.create(email: "admin@email.com", password: "password", password_confirmation: "password", first_name: "Admin", last_name: "User", phone: "4322312421")

puts "1 admin user created"

@user = User.create(email: "email@email.com", password: "password", password_confirmation: "password", first_name: "fname", last_name: "lname", phone: "4322312421")

puts "1 user created"

100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end

puts "100 Posts have been created"

100.times do |audit_log|
  AuditLog.create(user_id: User.last.id)
end

puts "100 Audit Logs have been created"
