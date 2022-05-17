class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      
      t.integer :talker_id
      t.string :title
      t.text :body
      t.boolean :is_check, default: false, null: false
      t.boolean :is_complete, default: false, null: false

      t.timestamps
    end
  end
end
