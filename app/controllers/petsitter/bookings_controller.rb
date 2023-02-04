class Petsitter::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:petsitter, Booking])
    # @bookings = Booking.includes(:pad).where(pads: { user: current_user })
  end

  def update
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_time, :end_time)
  end

  def booking_policy_authorize
    authorize @booking
  end
end
