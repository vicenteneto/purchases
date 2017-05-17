class Purchase < ApplicationRecord
  # model association
  belongs_to :client
  has_many :purchase_details, dependent: :destroy
  has_many :products, through: :purchase_details, dependent: :destroy

  accepts_nested_attributes_for :purchase_details

  # validations
  validates_presence_of :description, :total

  def as_json(options)
    super include: {purchase_details: {except: :purchase_id}}
  end
end
