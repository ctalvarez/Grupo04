class Chapter < ApplicationRecord
	belongs_to :serie, class_name: 'Serie'
	has_many :scores, dependent: :destroy
end
