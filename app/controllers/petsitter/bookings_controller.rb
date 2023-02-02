class Petsitter::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:petsitter, Booking])
    # @bookings = Booking.includes(:pad).where(pads: { user: current_user })
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      # redirect_to # up to you...
    else
      # render # where was the booking update form?
    end
  end

private
  def booking_params
    params.require(:booking).permit(:status, :start_time, :end_time)
  end

end
