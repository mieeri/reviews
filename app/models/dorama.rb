class Dorama < ApplicationRecord
  has_many :cast_doramas
  has_many :casts, through: :cast_doramas

  mount_uploader :image, ImageUploader

end