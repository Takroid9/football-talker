class CreateRecommends < ActiveRecord::Migration[5.2]
  def change
    create_table :recommends do |t|
      t.references :talker, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.timestamps
      t.index [:talker_id, :player_id], unique: true
    end
  end
end
