class CreateCatalogTables < ActiveRecord::Migration[7.2]
  def change
    create_table :families do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :families, :name, unique: true

    create_table :plants do |t|
      t.string :catalog_code, null: false
      t.string :name, null: false
      t.string :family_notes, null: false
      t.string :light, null: false
      t.references :family, null: false, foreign_key: true
      t.timestamps
    end
    add_index :plants, :catalog_code, unique: true
  end
end
