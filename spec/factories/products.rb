FactoryGirl.define do
  factory :product do
    name {Faker::Name.title}
    description {Faker::Lorem.sentence}
    price {Faker::Number.decimal(4, 2)}
  end
end
