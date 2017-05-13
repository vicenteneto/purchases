class Purchase < ApplicationRecord
  # model association
  belongs_to :client
  has_many :purchase_details
  has_many :products, through: :purchase_details

  # validations
  validates_presence_of :total
end
