class Usser < ApplicationRecord
  validates :user_name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum:3, maximum:15 }

  #add email validation using regular expression
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :user_email, presence: true, uniqueness: { case_sensitive: false}, length: { maximum:105 }, format: { with: VALID_EMAIL_REGEX }

  has_many :events, dependent: :destroy
end
