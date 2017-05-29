class Session < ApplicationRecord
  enum status: %i[OnDemand Finished]
  belongs_to :serie
  has_many :chapters, dependent: :destroy
end
