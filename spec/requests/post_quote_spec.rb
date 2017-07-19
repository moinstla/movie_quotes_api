require 'rails_helper'

describe "post quote route", :type => :request do


  before do
    movie = Movie.create(title: 'test', genre: 'genre', id: 1)
    post "/movies/#{movie.id}/quotes", params: { character: 'Sway', content: 'test quote', rating: 2, movie_id: 1 }
  end

  it 'returns the quote' do
    expect(JSON.parse(response.body)['title']).to eq "test"
  end

  it 'returns accepted status' do
    expect(response).to have_http_status 202
  end
end
