class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.date :date_release
      t.integer :status
      t.integer :session_number

      t.timestamps
    end
  end
end
