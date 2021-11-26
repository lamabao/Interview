FactoryGirl.define do
  factory :user do
    username  { Faker::Username.username }
    password  { Faker::Password.password }
  end
end