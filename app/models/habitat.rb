class Habitat < ApplicationRecord
  has_many :plant_habitats, dependent: :destroy
  has_many :plants, through: :plant_habitats

  validates :name, presence: true, uniqueness: true
end
