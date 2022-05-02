class Event < ApplicationRecord
  #validates name
  validates :name, presence: true
  #validates description and event date
  validates :description, :event_date, presence: true
  
  #add assosiations
  belongs_to :usser
  belongs_to :category
  has_many :enrollments
  has_many :comments, dependent: :destroy
end
