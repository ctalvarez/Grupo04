class AddSerieRefToChapter < ActiveRecord::Migration[5.0]
  def change
    add_reference :chapters, :serie, foreign_key: true
  end
end
