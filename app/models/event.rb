class Event < ApplicationRecord
  validates :name, presence: true
  validates :description, :event_date, presence: true
  
  belongs_to :usser
end
