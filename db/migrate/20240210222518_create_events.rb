class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_cat
      t.date :event_date
      t.datetime :event_start_time
      t.datetime :event_end_time
      t.decimal :ticket_price
      t.integer :no_of_seats

      t.timestamps
    end
  end
end
