class GardenUse < ApplicationRecord
  has_many :plant_garden_uses, dependent: :destroy
  has_many :plants, through: :plant_garden_uses

  validates :name, presence: true, uniqueness: true
end
