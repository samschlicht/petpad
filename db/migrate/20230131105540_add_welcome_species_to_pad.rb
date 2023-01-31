class AddWelcomeSpeciesToPad < ActiveRecord::Migration[7.0]
  def change
    add_column :pads, :welcome_species, :string
  end
end
