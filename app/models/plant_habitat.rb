class PlantHabitat < ApplicationRecord
  belongs_to :plant
  belongs_to :habitat

  validates :habitat_id, presence: true, uniqueness: { scope: :plant_id }
end
