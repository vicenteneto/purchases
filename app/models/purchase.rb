class Purchase < ApplicationRecord
  # model association
  belongs_to :client
  has_many :purchase_detail
  has_many :products, through: :purchase_detail

  # validations
  validates_presence_of :total
end
