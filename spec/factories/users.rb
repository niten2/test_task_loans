FactoryGirl.define do

  factory :user do
    sequence(:login)  { |n| "Person #{n}" }
    password '12345678'
    password_confirmation '12345678'
    sequence(:name)  { Faker::Name.first_name }
    sequence(:surname)  { Faker::Name.first_name }
    sequence(:patronymic)  { Faker::Name.first_name }
    sequence(:phone)  { 12345 }
    sequence(:territory)  { 1 }

    factory :admin do
      admin true
    end

  end

end

