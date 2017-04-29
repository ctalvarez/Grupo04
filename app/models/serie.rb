class Serie < ApplicationRecord

	enum idioms: [:Spanish, :English]

  has_many :chapters, dependent: :destroy
  belongs_to :user

  has_many :genre_series, class_name: 'GenreSerie', dependent: :destroy
  has_many :genres, through: :genre_series, class_name: 'Genre' do

  end

  scope :by_name, (->(serie_name) {where('name like ?', "%#{serie_name}%" )})
  scope :by_idiom, (->(serie_idiom) {where('idiom like ?', serie_idiom)})

end
