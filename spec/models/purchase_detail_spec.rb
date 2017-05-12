require 'rails_helper'

# Test suite for the PurchaseDetail model
RSpec.describe PurchaseDetail, type: :model do
  # Association test
  # ensure an purchase detail record belongs to a single purchase and product record
  it {should belong_to(:product)}
  it {should belong_to(:purchase)}

  # Validation test
  # ensure columns quantity is present before saving
  it {should validate_presence_of(:quantity)}
end
