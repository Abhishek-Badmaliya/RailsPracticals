class Newuser < ApplicationRecord
  #add validation for name, email and picture
  validates :name, :email, :picture, presence: true
  
  #add carrierWave
  mount_uploader :picture, PictureUploader
end
