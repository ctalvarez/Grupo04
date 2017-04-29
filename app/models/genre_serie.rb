class GenreSerie < ApplicationRecord

  belongs_to :serie, class_name: 'Serie'
  belongs_to :genre, class_name: 'Genre'

end
