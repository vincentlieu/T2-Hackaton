class CreateRoomMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :room_messages do |t|
      t.references :user_id, foreign_key: true
      t.references :room_id, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
