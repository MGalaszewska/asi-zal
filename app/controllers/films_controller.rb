class FilmsController < ApplicationController

  def index
   @films = Film.all.order('created_at DESC').page(params[:page]).per_page(6)
 end

  def show
   @film = Film.find(params[:id])
 end

  def new
    if user_signed_in?
     @film = Film.new
   else
    redirect_to new_user_session_path, :notice => "Please log-in"
    end
  end

  def edit
     if user_signed_in?
    @film = Film.find(params[:id])
  else
  redirect_to new_user_session_path, :notice => "Please log-in"
end
  end

  def destroy
     if user_signed_in?
    @film = Film.find(params[:id])
    @film.destroy

    redirect_to films_path
    else
    redirect_to new_user_session_path, :notice => "Please log-in"
    end
  end

  def create
  @film = Film.new(film_params)

    if @film.save
    redirect_to @film
    else
      render 'new'
    end
  end

  def update
  @film = Film.find(params[:id])

  if @film.update(film_params)
    redirect_to @film
  else
    render 'edit'
  end
end


  private
  def film_params
    params.require(:film).permit(:title, :director, :year, :poster)
  end
end
