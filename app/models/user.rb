class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum rol: [:admin, :user, :child]

	has_many :scores
	has_many :series, class_name: 'Serie'
end
