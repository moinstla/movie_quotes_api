class QuotesController < ApplicationController

  def index
    @movie = Movie.find(params[:movie_id])
    json_response(@movie.quotes)
  end

  def show
    @quote = Quote.find(params[:id])
    json_response(@quote)
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @quote = @movie.quotes.create(quote_params)
    json_response(@quote.movie, :accepted)
  end

  def update
    @quote = Quote.find(params[:id])
    @quote.update(quote_params)
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def quote_params
    params.permit(:character, :content)
  end
end
