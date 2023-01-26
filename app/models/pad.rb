class Pad < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :availability, presence: true
  validates :price_per_night, presence: true
  validates :description, presence: true
  validates :availability, presence: true

  has_one_attached :photo
end
