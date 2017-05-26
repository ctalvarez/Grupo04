class AddLanguageToSerie < ActiveRecord::Migration[5.0]
  def change
    add_column :series, :language, :string
  end
end
