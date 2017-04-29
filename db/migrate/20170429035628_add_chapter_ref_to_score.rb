class AddChapterRefToScore < ActiveRecord::Migration[5.0]
  def change
    add_reference :scores, :chapter, foreign_key: true
  end
end
