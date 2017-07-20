class MoviesController < ApplicationController
before_action :restrict_access

  def index
    @movies = Movie.all
    title = params[:title]
    @movies = Movie.title_search(title)
    json_response(@movies.page(params[:page]))

  end

  def show
    movie = Movie.find(params[:id])
    json_response(movie)
  end

  def most_quotes
    @movies = Movie.most_quotes
    json_response(@movies)
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

  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end

  # def restrict_access
  #   authenticate_or_request_with_http_token do |token, options|
  #     ApiKey.exists?(access_token: token)
  #   end
