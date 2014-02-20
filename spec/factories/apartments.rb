# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :apartment do
    url "MyString"
    description "MyString"
    price 1
    longitude 1.5
    latitude 1.5
  end
end
