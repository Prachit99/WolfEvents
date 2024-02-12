class CreateAdmins < ActiveRecord::Migration[7.1]
  def change
    create_table :admins do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :phone
      t.string :address
      t.string :credit_card

      t.timestamps
    end
  end
end
