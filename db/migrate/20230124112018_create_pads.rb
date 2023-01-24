class CreatePads < ActiveRecord::Migration[7.0]
  def change
    create_table :pads do |t|
      t.string :address
      t.string :title
      t.string :description
      t.float :price_per_night
      t.integer :capacity
      t.boolean :availability
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
