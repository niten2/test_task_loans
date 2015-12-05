FactoryGirl.define do
  factory :client do
    sequence(:name)  { Faker::Name.first_name }
    sequence(:surname)  { Faker::Name.first_name }
    sequence(:patronymic)  { Faker::Name.first_name }
    sequence(:phone)  { 12345 }
    sequence(:passport)  { 0405 }
    user

  end

end
