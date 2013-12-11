class Railscast < Railscasts::Screencast
  attr_accessor :watched

  def watched?
    @watched
  end

  def watch(user)
    user.watched_railscasts.create(:railscast_id => id)
  end

  def unwatch(user)
    user.watched_railscasts.find_by_railscast_id(id).destroy
  end

  def self.find(id)
    all.find {|item| item.id.to_i == id.to_i }
  end

  def self.all(user = nil)
    watched_list = []
    if user
      watched_list = user.watched_railscasts.collect(&:railscast_id)
    end

    list = Rails.cache.fetch 'railscasts', :expires_in => 60.minutes do
      super()
    end

    list.each do |item|
      item.watched = watched_list.include?(item.id)
    end

    list
  end
end
