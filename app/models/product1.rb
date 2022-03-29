class Product1 < ApplicationRecord
  validates :title, :description, :price, presence: true
end
