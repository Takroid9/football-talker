class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :short_name
      t.integer :league_id
      t.string :coach
      t.string :stadium

      t.timestamps
    end
  end
end
