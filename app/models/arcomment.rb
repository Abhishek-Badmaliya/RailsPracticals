class Arcomment < ApplicationRecord
  #add association
  belongs_to :article

  #add validation
  validates :comment_content, :date_of_comment, presence: true
end
