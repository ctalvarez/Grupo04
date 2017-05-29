class CreateSubtitleIntegrations < ActiveRecord::Migration[5.0]
  def change
    create_table :subtitle_integrations do |t|
      t.references :subtitle, foreign_key: true
      t.references :serie, foreign_key: true

      t.timestamps
    end
  end
end
