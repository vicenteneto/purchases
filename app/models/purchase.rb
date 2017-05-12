class Purchase < ApplicationRecord
  # model association
  belongs_to :client

  # validations
  validates_presence_of :total
end
