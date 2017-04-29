class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum rol: [:admin, :user, :child]
  #Arreglar esta parte para el default_user
  before_create :default_user
	has_many :scores
	has_many :series, class_name: 'Serie'


  #Aquí esta el parche para que por defecto sean usuarios!!!
  def default_user
      self.rol = :user
  end
end
