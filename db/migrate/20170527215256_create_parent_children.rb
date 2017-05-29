class CreateParentChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :parent_children do |t|
      t.references :parent
      t.references :child

      t.timestamps
    end
  end
end
