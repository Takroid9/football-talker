class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :team_id
      t.integer :number
      t.integer :position
      t.string :name
      t.string :lead_name
      t.string :country
      t.integer :foot
      t.integer :height
      t.integer :weight
      t.integer :birthday
      t.integer :is_active

      t.timestamps
    end
  end
end
