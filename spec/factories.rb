FactoryGirl.define do
  factory :user do
    locationcode  "ABC"
    name  "Name Namington"
    email "name@example.com"
    password  "foobar"
    password_confirmation "foobar"
  end
end