class CreateDirectorSeries < ActiveRecord::Migration[5.0]
  def change
    create_table :director_series do |t|
      t.references :director, foreign_key: true
      t.references :serie, foreign_key: true

      t.timestamps
    end
  end
end
