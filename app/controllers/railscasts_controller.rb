class RailscastsController < ApplicationController
  def index
    @watched_railscasts = WatchedRailscast.all.collect(&:railscast_id)
    @railscasts = Railscasts.all
  end

  def watch
    WatchedRailscast.create(:railscast_id => params[:id])
    redirect_to root_path
  end

  def unwatch
    WatchedRailscast.find_by_railscast_id(params[:id]).destroy
    redirect_to root_path
  end
end
