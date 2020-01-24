class CreateMurals < ActiveRecord::Migration[5.2]
  def change
    create_table :murals do |t|
      t.string :name
      t.integer :artist_id
      t.integer :commissioner_id
      t.integer :zip
      t.integer :year_installed
    end
  end
end
