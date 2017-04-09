FactoryGirl.define do

  factory :message do
    text          {Faker::Lorem.sentence}
    image         {Faker::Avatar.image}
    user_id       {Faker::Number.number(1)}
    group_id      {Faker::Avatar.image}
  end

end
