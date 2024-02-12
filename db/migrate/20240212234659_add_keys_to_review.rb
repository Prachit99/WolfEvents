class AddKeysToReview < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :attendee, null: false, foreign_key: true
    add_reference :reviews, :event, null: false, foreign_key: true
  end
end
