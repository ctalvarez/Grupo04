class AddDetailsToSeries < ActiveRecord::Migration[5.0]
  def change
    add_column :series, :country, :string
    add_column :series, :session_amount, :integer
    add_column :series, :year_release, :date
  end
end
