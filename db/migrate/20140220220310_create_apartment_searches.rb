class CreateApartmentSearches < ActiveRecord::Migration
  def change
    create_table :apartment_searches do |t|
      t.integer :user_id
      t.string :title
      t.integer :min_price
      t.integer :max_price

      t.timestamps
    end
  end
end
