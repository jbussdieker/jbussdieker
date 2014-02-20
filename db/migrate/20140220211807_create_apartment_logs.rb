class CreateApartmentLogs < ActiveRecord::Migration
  def change
    create_table :apartment_logs do |t|
      t.integer :apartment_id
      t.integer :user_id
      t.integer :status, :default => 0
      t.string :message

      t.timestamps
    end
  end
end
