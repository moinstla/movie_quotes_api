class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    json_response(@movies)
  end

  def show
    movie = Movie.find(params[:id])
    json_response(movie)
  end

private
  def json_response(object, status = :ok)
    render json: object.as_json(include: :quotes), status: status
  end
end
