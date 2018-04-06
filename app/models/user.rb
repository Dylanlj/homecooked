class User < ApplicationRecord

  has_secure_password

  has_many :user_ratings
  has_many :meal_postings
  has_many :meal_ratings
  has_many :reservations
end
