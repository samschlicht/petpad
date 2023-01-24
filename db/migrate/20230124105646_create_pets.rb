class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.integer :user_id
      t.string :name
      t.string :species
      t.text :comments

      t.timestamps
    end
  end
end
