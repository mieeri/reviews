class Dorama < ApplicationRecord
  has_many :cast_doramas
  has_many :casts, through: :cast_doramas

  mount_uploader :image, ImageUploader

  scope :by_tweet_number, -> { where(tweet_number: true) }

end