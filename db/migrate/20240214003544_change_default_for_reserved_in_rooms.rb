class ChangeDefaultForReservedInRooms < ActiveRecord::Migration[7.1]
  def change
    change_column_default :rooms, :reserved, from: nil, to: false
  end
end
