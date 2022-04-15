class Comment < ApplicationRecord

  #add associations
  belongs_to :usser
  belongs_to :event

end
