class Pad < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price_per_night, presence: true
  validates :description, presence: true

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
