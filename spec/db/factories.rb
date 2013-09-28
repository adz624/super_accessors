require 'factory_girl'
FactoryGirl.define do
  factory :user do
    name "Eddie"
    zipcode "12345"
    mobile "+886 5666533"
    available "false"

    admin "FALSE"
    manager "0"
    teacher "no"
    worker "True"
    factory :admin do
      name "Vicky"
      zipcode "293857"
      mobile nil
      available "NO"

      admin "T"
      manager "0"
      teacher "yes"
      worker "0"
    end
  end
end
