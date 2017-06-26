class Chapter < ApplicationRecord
  belongs_to :session
  has_many :seen, dependent: :destroy
  has_one :serie, through: :session, source: :serie
  has_many :scores, dependent: :destroy

  def general_score
    return 0 if scores.count == 0
    scores.sum(:score) / scores.count
  end
end
