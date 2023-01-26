class Pet < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :species, presence: true
  validates :user_id, presence: true
  validates :comments, presence: true
end
