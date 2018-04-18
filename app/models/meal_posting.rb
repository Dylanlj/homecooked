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
  validates :servings, presence: true, :numericality => { :greater_than => 0}
  validates :cost, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :date, presence: true
  validate  :end_time_cannot_be_earlier_than_start_time
  validate  :date_cannot_be_in_the_past

  def end_time_cannot_be_earlier_than_start_time

    if end_time
      if base_time > end_time
        errors.add(:end_time, "can't be earlier than the start time")
      end
    end
  end

  def date_cannot_be_in_the_past
    if date
      if date < Time.now
        errors.add(:date, "can't be set in the past")
      end
    end
  end
end
