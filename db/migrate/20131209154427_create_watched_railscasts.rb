class CreateWatchedRailscasts < ActiveRecord::Migration
  def change
    create_table :watched_railscasts do |t|
      t.integer :railscast_id

      t.timestamps
    end
  end
end
