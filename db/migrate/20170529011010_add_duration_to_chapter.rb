class AddDurationToChapter < ActiveRecord::Migration[5.0]
  def change
    add_column :chapters, :duration, :integer
  end
end
