class AddCoordinatesToPads < ActiveRecord::Migration[7.0]
  def change
    add_column :pads, :latitude, :float
    add_column :pads, :longitude, :float
  end
end
