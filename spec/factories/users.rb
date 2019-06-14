FactoryGirl.define do
  sequence :email do |i|
    "test#{i}@example.com"
  end

  factory :user do
    first_name 'Fname'
    last_name 'Lname'
    email { generate :email }
    password "password"
    password_confirmation "password"
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email { generate :email }
    password "password"
    password_confirmation "password"
  end
end
