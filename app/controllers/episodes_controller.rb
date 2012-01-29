class EpisodesController < ApplicationController

  def index
    @episodes = Episode.all
    @title = "MoxieTV Episodes"
  end

  def show
    @episode = Episode.find(params[:id])
    @title = "Moxie TV | Episode ##{@episode.id} | #{@episode.title}"
  end
  
end
