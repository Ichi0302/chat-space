FactoryGirl.define do

  factory :message do
    text          {Faker::Lorem.sentence}
    image         {Faker::Avatar.image}
    user_id       "3"
    group_id      "2"
  end

end
