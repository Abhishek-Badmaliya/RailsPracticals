class Usser < ApplicationRecord
  #validates the user name
  validates :user_name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum:3, maximum:15 }
  #add email validation using regular expression
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :user_email, presence: true, uniqueness: { case_sensitive: false}, length: { maximum:105 }, format: { with: VALID_EMAIL_REGEX }

  #association
  has_many :events, dependent: :destroy
  has_many :enrollments
  has_many :comments
  has_many :likes
  has_one :address
  accepts_nested_attributes_for :address, allow_destroy: true
  #adds methods to set and authenticate
  has_secure_password
end
