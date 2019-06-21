AdminUser.create(email: "admin@email.com", password: "password", password_confirmation: "password", first_name: "Admin", last_name: "User", phone: "4322312421", ssn: 1234, company: "my company")

puts "1 admin user created"

@user = Employee.create(email: "email@email.com", password: "password", password_confirmation: "password", first_name: "fname", last_name: "lname", phone: "4322312421", ssn: 1234, company: "my company")

puts "1 user created"

100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} Lorem ipsum dolor sit amet, id aenean, a facilisis integer nullam ut pede, id suspendisse eget sit viverra lectus condimentum, non pellentesque praesent tincidunt mollit. Erat bibendum nibh, porta ut eget praesent integer fringilla, at et facilisis sem ut dis ac, et tristique lacinia nec maecenas curabitur, facilisis nam lobortis nunc ultricies sagittis. Scelerisque sit, in nam tempor, sodales sit, eu volutpat eget lectus, faucibus suscipit diam. Venenatis scelerisque leo ad auctor volutpat eros, fringilla pede primis amet tristique, pede id eu class sit magna mi. Scelerisque auctor convallis arcu sodales in orci. Dis orci. At lacus enim potenti nunc vestibulum, commodo est, massa ullamcorper vivamus malesuada, fames fermentum in nec a, euismod leo neque sed eros. In gravida porta vitae nec eu. Felis cras leo, cursus lorem cursus sed felis integer, eu corrupti aliquam consectetuer dolorem vestibulum, mauris quam. Ornare turpis ornare sit, erat ultrices et curabitur tellus lacus, sit ante. Sit lectus nostra rutrum ut eget, luctus quis, turpis erat et, eu et justo sodales id. Aliquam aliquam tortor scelerisque, tortor fusce, ipsum semper mauris urna sapien nostra sagittis, mus eu donec interdum et, ac nostra pellentesque maecenas nam imperdiet donec.", user_id: @user.id, overtime_request: 2.5)
end

puts "100 Posts have been created"

AuditLog.create(user_id: User.last.id, start_date: (Date.today - 6.days))
AuditLog.create(user_id: User.last.id, start_date: (Date.today - 13.days))
AuditLog.create(user_id: User.last.id, start_date: (Date.today - 20.days))

puts "3 Audit Logs have been created"
