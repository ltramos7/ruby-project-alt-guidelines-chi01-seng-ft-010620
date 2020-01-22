class CreateCommissioners < ActiveRecord::Migration[5.2]
  def change
    create_table :commissioners do |t|
      t.string :affiliated_or_commissioning
    end
  end
end
