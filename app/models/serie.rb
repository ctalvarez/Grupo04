class Serie < ApplicationRecord

  has_many :chapters
  belongs_to :user
  has_many :genre_serie
  has_many :genres, through: :genre_serie
  scope :by_name, (->(serie_name) {where('name == ?', serie_name )})
  scope :by_genre, (->(serie_genre) {where('genres == ?', serie_genre )})
  scope :by_idiom, (->(serie_idiom) {where('idiom == ?', serie_idiom )})

end
