class CreateAttendees < ActiveRecord::Migration[6.1]
  def change
    create_table :attendees do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :phone
      t.string :address
      t.string :credit_card

      t.timestamps
    end
  end
end
