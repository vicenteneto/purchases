class Product < ApplicationRecord
  # model association
  has_many :purchase_details, dependent: :destroy
  has_many :purchases, through: :purchase_details, dependent: :destroy

  # validations
  validates_presence_of :name, :description, :price
end
