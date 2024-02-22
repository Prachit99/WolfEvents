class AddNumOfSeatsToEventTickets < ActiveRecord::Migration[7.1]
  def change
    add_column :event_tickets, :num_of_seats, :integer
  end
end
