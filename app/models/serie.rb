class Serie < ApplicationRecord
  enum language: %i[Spanish English]

  has_many :sessions, dependent: :destroy
  has_many :genre_series, class_name: 'GenreSerie', dependent: :destroy
  has_many :genres, through: :genre_series, class_name: 'Genre'
  has_many :subtitle_integrations, dependent: :destroy
  has_many :subtitles, through: :subtitle_integrations
  has_many :actor_series, dependent: :destroy
  has_many :actors, through: :actor_series, source: :actor
  has_many :sessions, dependent: :destroy
  has_one :director_series, dependent: :destroy
  has_one :director, through: :director_series, source: :director

  belongs_to :user
  before_create :default_private

  def self.search(name, language, genre, series)
    series = series.where('name ilike ?', "%#{name}%") if name.present?
    if language.present?
      series = series.where('language like ?', "%#{language}%")
    end
    if genre.present?
      genre_series = []
      genres = Genre.all
      genres.each do |g|
        genre_series << g.series if g.genre == genre
      end
      genre_series.uniq
      series &= genre_series[0]
    end
    series
  end

  def default_private
    self.private = false if private.nil?
  end
end
