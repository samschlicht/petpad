class Pad < ApplicationRecord
  belongs_to :user
<<<<<<< validations
  validates :title, presence: true
  validates :address, presence: true
  validates :pet_sitter_id, presence: true
  validates :description, presence: true
  validates :availability, presence: true
  validates :price_per_nice, presence: true
=======

  has_one_attached :photo
>>>>>>> master
end
