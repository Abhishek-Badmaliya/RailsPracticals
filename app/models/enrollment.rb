class Enrollment < ApplicationRecord

  #add assosiations
  belongs_to :usser
  belongs_to :event

end
