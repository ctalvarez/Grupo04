class AddSessionReferenceToChapter < ActiveRecord::Migration[5.0]
  def change
    remove_reference :chapters, :serie
    add_reference :chapters, :session, foreign_key: true
  end
end
