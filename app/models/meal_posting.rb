class MealPosting < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :meal_ratings
  has_many :media
  has_many :reservations

end
