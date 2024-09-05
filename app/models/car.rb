class Car < ApplicationRecord
  belongs_to :user

  validates :brand, presence: true
  validates :model, presence: true
  validates :adress, presence: true
  validates :price_per_day, presence: true, numericality: { greater_than: 0 }
end
