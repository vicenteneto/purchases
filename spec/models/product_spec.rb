require 'rails_helper'

# Test suite for the Product model
RSpec.describe Product, type: :model do
  # Validation test
  # ensure columns name, description and price is present before saving
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:description)}
  it {should validate_presence_of(:price)}
end
