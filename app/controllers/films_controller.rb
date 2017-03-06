class FilmsController < ApplicationController
  def index
   @films = Film.all
 end
  def show
   @film = Film.find(params[:id])
 end
  def new
  end
  def create
    @film = Film.new(film_params)

    @film.save
    redirect_to @film
  end

  private
  def film_params
    params.require(:film).permit(:title, :director, :year)
  end
end
