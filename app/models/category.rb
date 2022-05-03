class Category < ApplicationRecord
  #add association
  has_many :events

  #add validation
  validates :category_name, presence: true
end
