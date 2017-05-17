FactoryGirl.define do
  factory :purchase do
    client {create(:client)}
    description {Faker::Lorem.sentence}
    total {Faker::Number.decimal(8, 2)}
  end
end
