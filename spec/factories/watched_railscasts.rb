# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :watched_railscast, :class => 'WatchedRailscasts' do
    railscast_id 1
  end
end
