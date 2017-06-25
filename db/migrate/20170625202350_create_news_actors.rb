class CreateNewsActors < ActiveRecord::Migration[5.0]
  def change
    create_table :news_actors do |t|
      t.references :news, foreign_key: true
      t.references :actor, foreign_key: true

      t.timestamps
    end
  end
end
