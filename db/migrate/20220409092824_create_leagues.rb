class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :country
      t.integer :division

      t.timestamps
    end
  end
end
