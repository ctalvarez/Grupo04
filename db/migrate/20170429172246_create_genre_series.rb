class CreateGenreSeries < ActiveRecord::Migration[5.0]
  def change
    create_table :genre_series do |t|
      t.timestamps
    end
  end
end
