class CreateEventTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :event_tickets do |t|
      t.string :confirmation_num

      t.timestamps
    end
  end
end
