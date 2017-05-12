class Product < ApplicationRecord
  # validations
  validates_presence_of :name, :description, :price
end
