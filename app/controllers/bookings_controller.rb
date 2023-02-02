class BookingsController < ApplicationController
  before_action :set_pad, only: %i[new create]
  def new
    @booking = Booking.new
    booking_policy_authorize
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pad = @pad
    @booking.user = current_user
    @booking.save
    redirect_to bookings_path
    booking_policy_authorize
  end

  def index
    @bookings = policy_scope(Booking)
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def booking_params
    params.require(:booking).permit(:number_of_pets, :start_date, :end_date, :comment, :status, :user_id)
  end

  def set_pad
    @pad = Pad.find(params[:pad_id])
  end

  def booking_policy_authorize
    authorize @booking
  end
end
