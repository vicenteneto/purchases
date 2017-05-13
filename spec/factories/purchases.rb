FactoryGirl.define do
  factory :purchase do
    client {create(:client)}
    total {Faker::Number.decimal(8, 2)}
  end
end
