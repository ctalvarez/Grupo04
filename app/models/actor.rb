class Actor < ApplicationRecord
  has_many :actor_series, dependent: :destroy
  has_many :series, through: :actor_series, source: :serie
  has_many :news, through: :news_actors, source: :news
  has_many :news_actors, dependent: :destroy
end
