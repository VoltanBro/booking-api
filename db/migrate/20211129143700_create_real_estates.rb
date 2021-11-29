class CreateRealEstates < ActiveRecord::Migration[6.1]
  def change
    create_table :real_estates, id: :uuid  do |t|
      t.decimal :price, precision: 8, scale: 2, null: false
      t.string :country, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :building, null: false
      t.string :zip, null: false
      t.float :rating, default: 0, null: false
      t.datetime :check_in, null: false
      t.datetime :check_out, null: false
      t.integer :property_type, default: 0, null: false
      t.integer :property_status, default: 0, null: false

      t.timestamps
    end
  end
end
