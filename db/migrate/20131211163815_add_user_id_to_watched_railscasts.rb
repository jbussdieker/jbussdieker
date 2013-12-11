class AddUserIdToWatchedRailscasts < ActiveRecord::Migration
  def change
    add_column :watched_railscasts, :user_id, :integer
  end
end
