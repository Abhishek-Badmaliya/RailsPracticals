class Tproduct < ApplicationRecord
  #add validations
  validates :product_name, :price, :description, presence: true

  #add association
  belongs_to :nuser
end
