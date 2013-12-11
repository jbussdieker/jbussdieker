class RailscastsController < ApplicationController
  before_filter :authenticate_user!, except: :index

  def index
    @railscasts = Railscast.all(current_user)
  end

  def watch
    @railscast = Railscast.find(params[:id])
    @railscast.watch(current_user)
    redirect_to root_path
  end

  def unwatch
    @railscast = Railscast.find(params[:id])
    @railscast.unwatch(current_user)
    redirect_to root_path
  end
end
