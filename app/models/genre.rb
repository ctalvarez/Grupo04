class Genre < ApplicationRecord

  has_many :genre_serie, class_name: 'GenreSerie'
  has_many :series, through: :genre_serie, class_name: 'Serie'
end
