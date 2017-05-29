class CreateSeens < ActiveRecord::Migration[5.0]
  def change
    create_table :seens do |t|
      t.references :chapter, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
