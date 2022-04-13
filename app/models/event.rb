class Event < ApplicationRecord

  #validates name
  validates :name, presence: true

  #validates description and event date
  validates :description, :event_date, presence: true
  
  #assosiation
  belongs_to :usser
end
