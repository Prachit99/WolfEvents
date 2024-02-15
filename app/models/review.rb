class Review < ApplicationRecord
  belongs_to :attendee
  belongs_to :event

  validates :rating, presence: true
  validates :feedback, presence: true

end
