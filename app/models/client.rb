class Client < ApplicationRecord
  # validations
  validates_presence_of :first_name, :last_name, :email
end
