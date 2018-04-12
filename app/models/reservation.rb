class Reservation < ApplicationRecord
  validates :stripe_charge_id, presence: true

  belongs_to :user
  belongs_to :meal_posting
end
