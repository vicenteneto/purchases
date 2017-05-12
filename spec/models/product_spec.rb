require 'rails_helper'

# Test suite for the Product model
RSpec.describe Product, type: :model do
  # Association test
  # ensure Product model has a 1:m relationship with the PurchaseDetail model
  it {should have_many(:purchase_detail)}
  it {should have_many(:purchases).through(:purchase_detail)}

  # Validation test
  # ensure columns name, description and price is present before saving
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:description)}
  it {should validate_presence_of(:price)}
end
