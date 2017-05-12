require 'rails_helper'

# Test suite for the Client model
RSpec.describe Client, type: :model do
  # Association test
  # ensure Client model has a 0:m relationship with the Purchase model
  it {should have_many(:purchases).dependent(:destroy)}

  # Validation tests
  # ensure columns first_name, last_name and email are present before saving
  it {should validate_presence_of(:first_name)}
  it {should validate_presence_of(:last_name)}
  it {should validate_presence_of(:email)}
end
