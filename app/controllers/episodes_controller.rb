class EpisodesController < ApplicationController

  def episode_params
    params.require(:episode).permit(:title, :show_name, :season_number, :episode_number, :description, :air_date)
  end

  def show
    episode_id = params[:id] # retrieve episode ID from URI route
    @episode = Episode.find(episode_id) # look up episode by unique ID
    @tvshow = Tvshow.find(params[:tvshow_id])
    # will render app/views/episodes/show.<extension> by default
  end

  def index
    @episodes = Episode.all
    redirect_to tvshow_path(params[:tvshow_id])
  end

  def new
    # default: render 'new' template
    @tvshow = Tvshow.find(params[:tvshow_id])
  end

  def create
    @episode = Episode.create!(episode_params)
    @tvshow = Tvshow.find(params[:tvshow_id])
    @tvshow.episodes.push(@episode)
    
    flash[:notice] = "#{@episode.title} was successfully created."
    redirect_to tvshow_path(@tvshow)
  end

  def edit
    @episode = Episode.find params[:id]
  end

  def update
    @episode = Episode.find params[:id]
    @episode.update_attributes!(episode_params)
    flash[:notice] = "#{@episode.title} was successfully updated."
    redirect_to tvshow_episodes_path(params[:tvshow_id])
  end

  def destroy
    @episode = Episode.find(params[:id])
    @episode.destroy
    flash[:notice] = "Episode '#{@episode.title}' deleted."
    redirect_to tvshow_episodes_path(params[:tvshow_id])
  end

end
