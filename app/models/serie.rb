class Serie < ApplicationRecord

	enum idioms: [:Spanish, :English]

  has_many :chapters
  belongs_to :user

  has_many :genre_series, class_name: 'GenreSerie'
  has_many :genres, through: :genre_series, class_name: 'Genre'

  scope :by_name, (->(serie_name) {where('name == ?', serie_name )})
  scope :by_genre, (->(serie_genre) {where('genres == ?', serie_genre )})
  scope :by_idiom, (->(serie_idiom) {where('idiom == ?', serie_idiom )})

end
