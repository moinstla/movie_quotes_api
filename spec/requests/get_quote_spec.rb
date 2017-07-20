require 'rails_helper'

describe "get quote path" do

  before do
    token = FactoryGirl.create(:api_key)
    movie = Movie.create(title: 'test', genre: 'genre', id: 1)
    quote = FactoryGirl.create(:quote)
    get "/movies/#{movie.id}/quotes/#{quote.id}?access_token=#{token.access_token}"
  end

  it 'returns a quote' do
    expect(JSON.parse(response.body).size).to eq 6
  end

  it 'returns status code 200' do
    expect(response).to have_http_status :success
  end

end
