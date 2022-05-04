class Tproduct < ApplicationRecord
  #add validations
  validates :product_name, :price, :description, presence: true
end
