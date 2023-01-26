class BookingsController < ApplicationController
  before_action :set_pad, only: %i[new create index]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.list = @pad
    @booking.save
    redirect_to pad_path(@pad)
  end

  def index
    @booking = Booking.where(user: current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:number_of_pets, :start_date, :end_date, :comment, :status, :user_id)
  end

  def set_pad
    @pad = Pad.find(params[:pad_id])
  end
end
