class CreateSubtitles < ActiveRecord::Migration[5.0]
  def change
    create_table :subtitles do |t|
      t.string :language

      t.timestamps
    end
  end
end
