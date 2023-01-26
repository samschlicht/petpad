class PadsController < ApplicationController
  # before_action :set_list

  def new
  end

  def create
  end

  def edit
  end

  def show
    @pad = Pad.find_by(id: params[:id])
    if @pad.nil?
      flash[:alert] = "Pad not found"
      redirect_to pads_path
    end
  end


  def update
  end

  def destroy
  end

end
