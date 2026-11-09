module PlantsHelper
  ILLUSTRATED_FAMILIES = %w[
    composite-inspired legume-inspired grass-inspired mint-inspired
    rose-inspired iris-inspired violet-inspired lily-inspired
  ].freeze

  def plant_illustration_path(plant)
    family_slug = plant.family.name.parameterize
    illustration = ILLUSTRATED_FAMILIES.include?(family_slug) ? family_slug : "generic"
    "/plants/#{illustration}.svg"
  end
end
