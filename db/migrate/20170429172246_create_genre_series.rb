class CreateGenreSeries < ActiveRecord::Migration[5.0]
  def change
    create_table :genre_series, &:timestamps
  end
end
