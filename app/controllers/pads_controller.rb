class PadsController < ApplicationController
  # before_action :set_list

  def new
    @pad = Pad.new
  end

  def create
    @pad = Pad.new(pad_params)
    if @pad.save
      redirect_to @pad
    else
      render :new
    end
  end

  def edit
  end

  def index
    @pads = Pad.all
  end

  def show
    @pad = Pad.find_by(id: params[:id])
    authorize @pad
    if @pad.nil?
      flash[:alert] = "Pad not found"
      redirect_to pads_path

    end
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
