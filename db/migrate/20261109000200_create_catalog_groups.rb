class CreateCatalogGroups < ActiveRecord::Migration[7.2]
  def change
    create_table :habitats do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :habitats, :name, unique: true

    create_table :garden_uses do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :garden_uses, :name, unique: true

    create_table :plant_habitats do |t|
      t.references :plant, null: false, foreign_key: true
      t.references :habitat, null: false, foreign_key: true
      t.timestamps
    end
    add_index :plant_habitats, [:plant_id, :habitat_id], unique: true

    create_table :plant_garden_uses do |t|
      t.references :plant, null: false, foreign_key: true
      t.references :garden_use, null: false, foreign_key: true
      t.timestamps
    end
    add_index :plant_garden_uses, [:plant_id, :garden_use_id], unique: true
  end
end
