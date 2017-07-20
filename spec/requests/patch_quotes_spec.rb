require 'rails_helper'

describe "patch quote route", :type => :request do


  before do
    token = FactoryGirl.create(:api_key)
    movie = Movie.create(title: 'test', genre: 'genre', id: 1)
    quote = FactoryGirl.create(:quote)
    patch "/movies/#{movie.id}/quotes/#{quote.id}?access_token=#{token.access_token}",
    params: {
      :character => "new character",
      :content => "new content"
    }
  end

  it 'returns the quote' do
    expect(JSON.parse(response.body)['message']).to eq "Quote has been updated."
  end

  it 'returns accepted status' do
    expect(response).to have_http_status 200
  end
end
