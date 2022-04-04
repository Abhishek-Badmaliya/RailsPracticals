class Product1 < ApplicationRecord
  validates :title, :description, :price, :capacity, :status, presence: true
  enum status: [:In_stock, :Out_of_stock, :Coming_soon]
  default_scope { where(is_active: true ) }
  has_many :orders, dependent: :destroy
end
