FactoryGirl.define do
  factory :purchase_details do
    client {create(:client)}
    product {create(:product)}
    quantity {Faker::Number.positive}
  end
end
