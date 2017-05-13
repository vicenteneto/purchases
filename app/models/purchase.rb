class Purchase < ApplicationRecord
  # model association
  belongs_to :client
  has_many :purchase_details, dependent: :destroy
  has_many :products, through: :purchase_details, dependent: :destroy

  # validations
  validates_presence_of :total

  def as_json(options)
    super include: {purchase_details: {except: :purchase_id}}
  end
end
