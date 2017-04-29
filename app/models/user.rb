class User < ApplicationRecord
  enum rol: [:admin, :user, :child]
	has_many :scores
	has_many :series
end
