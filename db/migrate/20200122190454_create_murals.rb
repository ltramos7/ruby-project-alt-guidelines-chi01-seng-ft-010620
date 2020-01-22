class CreateMurals < ActiveRecord::Migration[5.2]
  def change
    create_table :murals do |t|
      t.string :artist_credit
      t.string :affiliated_or_commissioning
      t.integer :zip
      t.integer :year_installed
    end
  end
end
