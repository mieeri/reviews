class Cast < ApplicationRecord
  has_many :cast_doramas
  has_many :doramas, through: :cast_doramas
end
