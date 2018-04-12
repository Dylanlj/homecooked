class Reservation < ApplicationRecord
  validates :number_of_people, numericality: {greater_than: 0}


  belongs_to :user
  belongs_to :meal_posting
end
