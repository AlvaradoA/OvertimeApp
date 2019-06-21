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
    phone "1234512345"
    company "my company"
    ssn 1234
  end

  factory :employee, class: "Employee" do
    first_name 'Fname'
    last_name 'Lname'
    email { generate :email }
    password "password"
    password_confirmation "password"
    phone "1234512345"
    company "my company"
    ssn 1234
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email { generate :email }
    password "password"
    password_confirmation "password"
    phone "1234512345"
    company "my company"
    ssn 1234
  end

  factory :non_authorized_user, class: "User" do
    first_name 'Non'
    last_name 'Authorized'
    email { generate :email }
    password "password"
    password_confirmation "password"
    phone "1234512345"
    company "my company"
    ssn 1234
  end

end
