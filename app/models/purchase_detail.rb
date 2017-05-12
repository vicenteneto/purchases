class PurchaseDetail < ApplicationRecord
  # model association
  belongs_to :product
  belongs_to :purchase

  # validations
  validates_presence_of :quantity
end
