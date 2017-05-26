class CreateChildFilters < ActiveRecord::Migration[5.0]
  def change
    create_table :child_filters do |t|
      t.references :user
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
