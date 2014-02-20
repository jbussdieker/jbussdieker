class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :url
      t.string :description
      t.integer :price
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
