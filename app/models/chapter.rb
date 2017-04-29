class Chapter < ApplicationRecord
	belongs_to :serie
	has_many :scores
end
