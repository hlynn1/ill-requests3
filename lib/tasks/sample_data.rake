namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(locationcode: "QXI",
                  name: "Example User",
                  email: "qxi@example.com",
                  password: "foobar",
                  password_confirmation: "foobar")
    50.times do |n|
      locationcode = "A#{n+1}Z"
      name = Faker::Name.name
      email = Faker::Internet.email
      User.create!(locationcode: locationcode,
                    name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
    end
  end
end