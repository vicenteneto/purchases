class Product < ApplicationRecord
  # model association
  has_many :purchase_details
  has_many :purchases, through: :purchase_details

  # validations
  validates_presence_of :name, :description, :price
end
