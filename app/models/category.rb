class Category < ApplicationRecord

  #add validation
  validates :category_name, presence: true
  
end
