require 'rails_helper'

# Test suite for the Purchase model
RSpec.describe Purchase, type: :model do
  # Association test
  # ensure an purchase record belongs to a single client record
  it {should belong_to(:client)}
  # ensure Purchase model has a 1:m relationship with the PurchaseDetail model
  it {should have_many(:purchase_details)}
  it {should have_many(:products).through(:purchase_details)}

  # Validation test
  # ensure column total is present before saving
  it {should validate_presence_of(:total)}
end
