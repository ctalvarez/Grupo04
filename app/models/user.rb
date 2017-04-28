class User < ApplicationRecord
  enum rol: [:admin, :user, :child]
end
