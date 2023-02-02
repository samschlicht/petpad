class Petsitter::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:petsitter, Booking])
    # @bookings = Booking.includes(:pad).where(pads: { user: current_user })
  end
end
