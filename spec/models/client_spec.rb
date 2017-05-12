require 'rails_helper'

RSpec.describe Client, type: :model do
  # Validation tests
  # ensure columns title and created_by are present before saving
  it {should validate_presence_of(:first_name)}
  it {should validate_presence_of(:last_name)}
  it {should validate_presence_of(:email)}
end
