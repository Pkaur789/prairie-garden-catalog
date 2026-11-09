class Plant < ApplicationRecord
  LIGHT_OPTIONS = ["Full sun", "Partial shade", "Shade"].freeze

  belongs_to :family, inverse_of: :plants
  has_many :plant_habitats, dependent: :destroy
  has_many :habitats, through: :plant_habitats
  has_many :plant_garden_uses, dependent: :destroy
  has_many :garden_uses, through: :plant_garden_uses

  validates :catalog_code, presence: true, uniqueness: true
  validates :name, :family_notes, presence: true
  validates :light, inclusion: { in: LIGHT_OPTIONS }
end
