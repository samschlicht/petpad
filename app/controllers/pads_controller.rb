class PadsController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def strong_params
    params.require(:pad).permit(:address, :title, :description, :price_per_night, :capacity, :availability, :photo)
  end

end
