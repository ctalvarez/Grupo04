class Genre < ApplicationRecord

  has_many :genre_serie
  has_many :series, through: :genre_serie
end
