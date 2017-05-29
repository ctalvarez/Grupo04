class Actor < ApplicationRecord
  has_many :actor_series, dependent: :destroy
  has_many :series, through: :actor_series, source: :serie
end
