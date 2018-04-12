class MealRating < ApplicationRecord

  validates :comment, presence: true

  belongs_to :meal_posting
  belongs_to :user
end
