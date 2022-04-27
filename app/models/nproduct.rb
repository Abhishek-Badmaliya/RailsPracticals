class Nproduct < ApplicationRecord
  #add validation
  validates :name, :price, :description, presence: true

  #add association
  has_many :norders, dependent: :destroy
end
