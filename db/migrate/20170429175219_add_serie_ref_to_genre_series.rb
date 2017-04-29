class AddSerieRefToGenreSeries < ActiveRecord::Migration[5.0]
  def change
    add_reference :genre_series, :serie, foreign_key: true
  end
end
