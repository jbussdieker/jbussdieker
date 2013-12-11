class WatchedRailscast < ActiveRecord::Base
  validates_uniqueness_of :railscast_id, :scope => :user_id
end
