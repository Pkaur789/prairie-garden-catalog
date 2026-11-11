require "csv"
require "open-uri"

DATASET_BASE_URL = "https://raw.githubusercontent.com/Pkaur789/prairie-garden-catalog/master/db/data"

def catalog_rows(file_name, &block)
  url = "#{DATASET_BASE_URL}/#{file_name}"

  URI.open(url) do |file|
    CSV.new(file, headers: true).each(&block)
  end
end


ActiveRecord::Base.transaction do
  plants = {}

  catalog_rows("plants.csv") do |row|
    family = Family.find_or_create_by!(name: row.fetch("family"))
    code = row.fetch("catalog_code")
    plant = Plant.find_or_initialize_by(catalog_code: code)
    plant.update!(name: row.fetch("name"), family_notes: row.fetch("family_notes"),
                  light: row.fetch("light"), family: family)
    plants[code] = plant
  end

  catalog_rows("habitats.csv") do |row|
    plant = plants.fetch(row.fetch("catalog_code"))
    habitat = Habitat.find_or_create_by!(name: row.fetch("habitat"))
    plant.plant_habitats.find_or_create_by!(habitat: habitat)
  end

  catalog_rows("garden_uses.csv") do |row|
    plant = plants.fetch(row.fetch("catalog_code"))
    garden_use = GardenUse.find_or_create_by!(name: row.fetch("garden_use"))
    plant.plant_garden_uses.find_or_create_by!(garden_use: garden_use)
  end
end

models = [Plant, Family, Habitat, GardenUse, PlantHabitat, PlantGardenUse]
counts = models.map { |model| [model.table_name, model.count] }.to_h
puts counts.map { |table, count| "#{table}: #{count}" }.join(", ")
puts "Total rows: #{counts.values.sum}"
