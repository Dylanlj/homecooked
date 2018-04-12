class Reservation < ApplicationRecord
  validates :number_of_people, numericality: {greater_than: 0}
  validates :time, presence: true

  belongs_to :user
  belongs_to :meal_posting
end
