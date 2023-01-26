class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true
  validates :species, presence: true
  validates :user, presence: true
  validates :comments, presence: true
end
