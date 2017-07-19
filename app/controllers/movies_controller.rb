class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    title = params[:title]
    @movies = Movie.title_search(title)
    json_response(@movies)
  end

  def show
    movie = Movie.find(params[:id])
    json_response(movie)
  end

  def create
    @movie = Movie.create!(movie_params)
    json_response(@movie, :accepted)
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update!(movie_params)
      render status: 200, json: {
        message: "Movie has been updated."
      }
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    if @movie.destroy!
      render status: 200, json: {
        message: "The movie has been deleted."
      }
  end
end

private
  def json_response(object, status = :ok)
    render json: object.as_json(include: :quotes), status: status
  end

  def movie_params
    params.permit(:title, :genre)
  end
end
