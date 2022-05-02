class Naddress < ApplicationRecord
  #add association
  belongs_to :nemployee

  #validates the housename streetname and road
  validates :house_name, :street_name, :road, presence: true
end
