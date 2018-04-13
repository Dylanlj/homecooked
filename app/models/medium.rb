class Medium < ApplicationRecord

  attr_accessor :url

  mount_uploader :url, AvatarUploader

  belongs_to :meal_postings, optional: true
end
