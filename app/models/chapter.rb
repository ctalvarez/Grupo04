class Chapter < ApplicationRecord
	belongs_to :session
	has_many :scores, dependent: :destroy
end
