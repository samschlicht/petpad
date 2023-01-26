class Pad < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :title, presence: true
  validates :address, presence: true
  validates :user, presence: true
  validates :description, presence: true
  validates :availability, presence: true
  validates :price_per_night, presence: true
end
