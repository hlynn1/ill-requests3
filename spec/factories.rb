FactoryGirl.define do
  factory :user do
    sequence(:locationcode) { |n| "ABC#{n}" }
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password  "foobar"
    password_confirmation "foobar"
    
    factory :admin do
      admin true
    end
  end
  
  factory :request do
    sequence(:customer_id)
    oclcnum 100000
    title "Book Title"
    locationplaced "QXI"
    duedate "2012-09-01"
    location_id 1
    bclitem 39878012345678
  end
 
  factory :customer do
    sequence(:userid) { |n| "90001234#{n}" }
    firstname "John"
    lastname "Smith"
    email "customer@example.com"
  end
  
  factory :activity do
    status_id 1
    request
  end
  
  factory :status do
    name "Status"
  end
  
end