class AddSerieReferenceToSession < ActiveRecord::Migration[5.0]
  def change
    add_reference :sessions, :serie, foreign_key: true
  end
end
