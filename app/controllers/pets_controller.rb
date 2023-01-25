class PetsController < ApplicationController

  private

  def strong_params
    params.require(:pet).permit(:name, :species, :comments, :photo)
  end
end
