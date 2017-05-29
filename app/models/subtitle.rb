class Subtitle < ApplicationRecord
  has_many :subtitle_integrations, dependent: :destroy
  has_many :series, through: :subtitle_integrations, source: :serie
end
