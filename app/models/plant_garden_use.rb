class PlantGardenUse < ApplicationRecord
  belongs_to :plant
  belongs_to :garden_use

  validates :garden_use_id, presence: true, uniqueness: { scope: :plant_id }
end
