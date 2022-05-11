class Article < ApplicationRecord
  #add association
  has_many :arcomments, dependent: :destroy 
end
