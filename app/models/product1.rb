class Product1 < ApplicationRecord
  validates :title, :description, :price, :capacity, :is_active,:status, presence: true
  enum status: [:In_stock, :Out_of_stock, :Coming_soon]
  default_scope { where(:is_active => "Yes") }
  has_many :orders, dependent: :destroy
end
