class CreateCommissioners < ActiveRecord::Migration[5.2]
  def change
    create_table :commissioners do |t|
      t.string :name
    end
  end
end
