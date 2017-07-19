require 'rails_helper'
describe "delete quote route", :type => :request do

  before do
    movie = Movie.create(title: 'test', genre: 'genre', id: 1)
    quote = FactoryGirl.create(:quote)
    delete "/movies/#{movie.id}/quotes/#{quote.id}"
  end

  it 'destroys quote' do
    expect(response).to have_http_status 204
  end
end
