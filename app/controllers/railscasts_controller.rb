class RailscastsController < ApplicationController
  def index
    @railscasts = Railscast.all
  end

  def watch
    @railscast = Railscast.find(params[:id])
    @railscast.watch
    redirect_to root_path
  end

  def unwatch
    @railscast = Railscast.find(params[:id])
    @railscast.unwatch
    redirect_to root_path
  end
end
