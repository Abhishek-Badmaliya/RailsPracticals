class Event < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, :event_date, presence: true
  
  belongs_to :usser
end
