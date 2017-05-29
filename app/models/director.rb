class Director < ApplicationRecord
  has_many :director_series, dependent: :destroy
  has_many :series, through: :director_series, source: :serie
end
