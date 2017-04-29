class Serie < ApplicationRecord
	has_many :chapters
	belongs_to :user
	has_many :genre_serie
	has_many :genres, through: :genre_serie
end
