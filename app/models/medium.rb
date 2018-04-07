class Medium < ApplicationRecord
  belongs_to :meal_postings, optional: true
end
