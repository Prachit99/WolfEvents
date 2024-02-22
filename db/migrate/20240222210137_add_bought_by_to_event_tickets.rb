class AddBoughtByToEventTickets < ActiveRecord::Migration[7.1]
  def change
    add_column :event_tickets, :bought_by, :integer
  end
end
