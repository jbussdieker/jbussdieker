# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :apartment_log do
    apartment_id 1
    user_id 1
    message "MyString"
  end
end
