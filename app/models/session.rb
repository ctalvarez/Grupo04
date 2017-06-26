class Session < ApplicationRecord
  enum status: %i[OnDemand Finished]
  belongs_to :serie
  has_many :chapters, dependent: :destroy

  def general_score
    return 0 if chapters.count == 0
    chapters.sum(&:general_score) / chapters.count
  end
end
