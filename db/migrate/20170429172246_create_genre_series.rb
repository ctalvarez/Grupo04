class CreateGenreSeries < ActiveRecord::Migration[5.0]
  def change
    create_table :genre_series do |t|
      t.integer :serie_id
      t.integer :genre_id

      t.timestamps
    end

    add_index :genre_series, :serie_id
    add_index :genre_series, :genre_id
  end
end
