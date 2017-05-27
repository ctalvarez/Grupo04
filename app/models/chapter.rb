class Chapter < ApplicationRecord
  belongs_to :session
  has_many :seen, dependent: :destroy
  has_one :serie, through: :session, source: :serie
  has_many :scores, dependent: :destroy
end
