class AddReservedToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :reserved, :boolean
  end
end
