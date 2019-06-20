namespace :notification do
  desc "Sends SMS notification to employees asking them to log overtime"
  task sms: :environment do
    if Time.now.sunday?
    # Schedule to run at Sunday at 5pm
    # Iterate oveer all employees
    # Skip AdminUsers
    # Send a msg that has instructions and a link to log time
    # User.all.each do |user|
    #   SmsTool.send_sms()
    # end
    end
  end

  desc "Sends mail notification to AdminUsers each day for pending overtime requests"
  task manager_email: :environment do
    # Iterate over list of overtime requests
    # Check to see if there are any requests
    # Iterate over the list of admin users
    # Send email to admins
    submitted_posts = Post.submitted
    admin_users = AdminUser.all
    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_later
      end
      puts "SENT EMAIL"
    end
  end
end
