class Client < ApplicationRecord
  # model association
  has_many :purchases, dependent: :destroy

  # validations
  validates_presence_of :first_name, :last_name, :email
end
