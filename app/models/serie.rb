class Serie < ApplicationRecord

	enum idioms: [:Spanish, :English]

  has_many :chapters, dependent: :destroy
  has_many :genre_series, class_name: 'GenreSerie', dependent: :destroy
  has_many :genres, through: :genre_series, class_name: 'Genre'


  belongs_to :user
	before_create :default_private

  def self.search(name, idiom, genre)
    series = self.where(private: false)

    if name.present?
      series = series.where('name ilike ?', "%#{name}%" )
    end
    if idiom.present?
      series = series.where('idiom like ?', "%#{idiom}%")
    end
    if genre.present?
      genre_series = []
      genres = Genre.all
      genres.each do |g|
        if g.genre == genre
          genre_series << g.series
        end
      end
      genre_series.uniq
      series = series & genre_series[0]
    end
    series
  end

<<<<<<< HEAD
  scope :by_name, (->(serie_name) {where('name like ?', "%#{serie_name}%" )})
  scope :by_idiom, (->(serie_idiom) {where('idiom like ?', Serie.idioms.key(serie_idiom.to_i))})
=======
>>>>>>> 2fd1c97ef185fc939505716e6614b9b2b1c15619


	def default_private
		if self.private == nil
			self.private = false
		end
	end
end
