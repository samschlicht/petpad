class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :number_of_pets
      t.date :start_date
      t.date :end_date
      t.string :comment
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :pad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
