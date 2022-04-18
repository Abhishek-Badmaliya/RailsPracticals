class Anproduct < ApplicationRecord
  #add validation
  validates :product_name, :product_price, :product_description, presence: true

  #add association
  has_many :anorders, dependent: :destroy
end
