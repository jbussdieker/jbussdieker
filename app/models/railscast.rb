class Railscast < Railscasts::Screencast
  attr_accessor :watched

  def watched?
    @watched
  end

  def watch
    WatchedRailscast.create(:railscast_id => id)
  end

  def unwatch
    WatchedRailscast.find_by_railscast_id(id).destroy
  end

  def self.find(id)
    all.find {|item| item.id.to_i == id.to_i }
  end

  def self.all
    watched_list = WatchedRailscast.all.collect(&:railscast_id)

    list = Rails.cache.fetch 'railscasts', :expires_in => 5.minutes do
      super
    end

    list.each do |item|
      item.watched = watched_list.include?(item.id)
    end

    list
  end
end
