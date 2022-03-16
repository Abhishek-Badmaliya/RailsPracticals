class Author < ApplicationRecord
  validates:first_name, presence:true
  validates:last_name, presence:true
  has_many :books, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
end
