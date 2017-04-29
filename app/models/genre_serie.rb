class GenreSerie < ApplicationRecord

  belongs_to :serie, class_name: 'Serie'
  belongs_to :genre, class_name: 'Genre'

  scope :by_genre, (->(serie_genre) {where('genre = ?', serie_genre )})
end
