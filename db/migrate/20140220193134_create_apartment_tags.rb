class CreateApartmentTags < ActiveRecord::Migration
  def change
    create_table :apartment_tags do |t|
      t.integer :apartment_id
      t.string :value

      t.timestamps
    end
  end
end
