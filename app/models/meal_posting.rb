class MealPosting < ApplicationRecord

  attr_accessor :image

  mount_uploader :image, AvatarUploader

  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :meal_ratings
  has_many :media
  has_many :reservations

  validates :base_time, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :servings, presence: true
  validates :cost, presence: true
  validates :date, presence: true

end
