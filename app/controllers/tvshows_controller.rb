class TvshowsController < ApplicationController

  def tvshow_params
    params.require(:tvshow).permit(:show_name, :description)
  end

  def show
    id = params[:id] # retrieve tvshow ID from URI route
    @tvshow = Tvshow.find(id) # look up tvshow by unique ID
    # will render app/views/tvshows/show.<extension> by default
  end

  def index
    @tvshows = Tvshow.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @tvshow = Tvshow.create!(tvshow_params)
    flash[:notice] = "#{@tvshow.show_name} was successfully created."
    redirect_to tvshows_path
  end

  def edit
    @tvshow = Tvshow.find params[:id]
  end

  def update
    @tvshow = Tvshow.find params[:id]
    @tvshow.update_attributes!(tvshow_params)
    flash[:notice] = "#{@tvshow.show_name} was successfully updated."
    redirect_to tvshow_path(@tvshow)
  end

  def destroy
    @tvshow = Tvshow.find(params[:id])
    @tvshow.destroy
    flash[:notice] = "Tv show '#{@tvshow.show_name}' deleted."
    redirect_to tvshows_path
  end

end
