class AddPrivateToSeries < ActiveRecord::Migration[5.0]
  def change
    add_column :series, :private, :boolean
  end
end
