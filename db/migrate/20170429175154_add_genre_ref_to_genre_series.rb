class AddGenreRefToGenreSeries < ActiveRecord::Migration[5.0]
  def change
    add_reference :genre_series, :genre, foreign_key: true
  end
end
