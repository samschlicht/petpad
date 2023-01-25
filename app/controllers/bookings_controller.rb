class BookingsController < ApplicationController
  before_action :set_pad, only: [:new, :create]
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.list = @pad
    @booking.save
    redirect_to pad_path(@pad)
  end

  private

  def booking_params
    params.require(:booking).permi(:number_of_pets, :start_date, :end_date, :comment, :status, :user_id)
  end
end
