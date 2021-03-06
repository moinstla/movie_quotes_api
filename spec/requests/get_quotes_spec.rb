require 'rails_helper'

describe "get quotes route", :type => :request do

  before do
    token = FactoryGirl.create(:api_key)
    movie = Movie.create(title: 'test', genre: 'genre', id: 1)
    quote = FactoryGirl.create(:quote)
    get "/movies/#{movie.id}/quotes?access_token=#{token.access_token}"
  end

  it 'returns all quotes' do
    expect(JSON.parse(response.body).size).to eq 1
  end

  it 'returns status code 200' do
    expect(response).to have_http_status :success
  end

end
