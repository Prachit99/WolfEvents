class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.decimal :rating
      t.string :feedback

      t.timestamps
    end
  end
end
