class BookingsController < ApplicationController
  before_action :set_pad, only: %i[new create index]

  def new
    @booking = Booking.new
    booking_policy_authorize
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pad = @pad
    @booking.user = current_user
    @booking.save
    redirect_to pad_path(@pad)
    booking_policy_authorize
  end

  def index
    # if set_pad == true

    @booking = Booking.where(user: current_user)
    # @booking = Booking.all

    # @booking = policy_scope(Booking)
    # there is no id because there is no booking, so conditional?
    # else
    # redirect_to new_booking_path(user: current_user)
    # booking_policy_authorize
    # end
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
