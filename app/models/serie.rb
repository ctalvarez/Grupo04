class Serie < ApplicationRecord
	has_many :chapters
	belongs_to :user
end
