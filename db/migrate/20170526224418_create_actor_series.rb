class CreateActorSeries < ActiveRecord::Migration[5.0]
  def change
    create_table :actor_series do |t|
      t.references :actor, foreign_key: true
      t.references :serie, foreign_key: true

      t.timestamps
    end
  end
end
