class Booking < ApplicationRecord
  belongs_to :pad
  belongs_to :user

  validate :end_date_is_after_start_date

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :pet_id, presence: true
  validates :user_id, presence: true

  private
  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?
    errors.add(:end_date, "must be after the start date") if end_date < start_date
  end
end
