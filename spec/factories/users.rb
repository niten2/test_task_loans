FactoryGirl.define do

  factory :user do
    sequence(:login)  { |n| "Person #{n}" }
    password '12345678'
    password_confirmation '12345678'

    factory :admin do
      admin true
    end

  end

end

