class Booking < ApplicationRecord
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  belongs_to :car
  belongs_to :user
end
