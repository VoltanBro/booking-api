class CreateRealEstateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :real_estate_properties, id: :uuid do |t|
      t.integer :guests, default: 1, null: false
      t.integer :bed_room, default: 0, null: false
      t.integer :bed, default: 0, null: false
      t.integer :bath, default: 0, null: false
      t.boolean :kitchen, default: false
      t.boolean :wifi, default: false
      t.boolean :parking, default: false
      t.boolean :backyard, default: false
      t.boolean :pets_allowed, default: false
      t.string :description, null: false

      t.references :real_estate, type: :uuid, null: false
      t.timestamps
    end
  end
end
