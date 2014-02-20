class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :url
      t.string :title
      t.string :neighborhood
      t.integer :price
      t.float :longitude
      t.float :latitude
      t.datetime :posted_at

      t.timestamps
    end
  end
end
