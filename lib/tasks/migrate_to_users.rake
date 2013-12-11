desc "Migrate users"
task :migrate_to_users => :environment do
  WatchedRailscast.all.each do |wr|
    wr.update_attributes(:user_id => 1)
  end
end
