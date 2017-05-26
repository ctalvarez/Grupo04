class GenreSerie < ApplicationRecord

  belongs_to :serie, class_name: 'Serie'
  belongs_to :genre, class_name: 'Genre'

  scope :by_genre, (->(genreserie_genre) {where('genre like ?', genreserie_genre)})

end
