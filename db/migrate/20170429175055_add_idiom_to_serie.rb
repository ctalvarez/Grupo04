class AddIdiomToSerie < ActiveRecord::Migration[5.0]
  def change
    add_column :series, :idiom, :string
  end
end
