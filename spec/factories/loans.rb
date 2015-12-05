FactoryGirl.define do
  factory :loan do
    sequence(:total_sum)  { 200 }
    client

  end

end
