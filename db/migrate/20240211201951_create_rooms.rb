class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :room_loc
      t.integer :room_cap

      t.timestamps
    end
  end
end
