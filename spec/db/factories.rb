require 'factory_girl'
FactoryGirl.define do
  factory :user do
    name "Eddie"
    zipcode "12345"
    mobile "+886 5666533"
    available "True"

    admin "False"
    manager "0"
    teacher "1"
    worker "True"

  end
  factory :user2 do
    name "Eddie"
    zipcode 12345
    mobile "+886 5666533"
    available "F"

    admin "T"
    manager "X"
    teacher "0"
    worker "1"
  end
  factory :user3 do
    name "Eddie"
    zipcode 12345
    mobile "+886 5666533"
    available "F"

    admin ""
    manager ""
    teacher "False"
    worker "True"
  end
end
