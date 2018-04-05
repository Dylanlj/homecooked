class MealRating < ApplicationRecord
  belongs_to :meal_posting
  belongs_to :user
end
