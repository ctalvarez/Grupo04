class Score < ApplicationRecord
	belongs_to :chapter
	belongs_to :user
end
