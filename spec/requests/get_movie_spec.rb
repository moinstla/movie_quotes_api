require 'rails_helper'

describe "get movie path" do

  before do
    token = FactoryGirl.create(:api_key)
    movie = FactoryGirl.create(:movie)
    get "/movies/#{movie.id}?access_token=#{token.access_token}"
  end

  it 'returns a movie' do
    expect(JSON.parse(response.body).size).to eq 6
  end

  it 'returns status code 200' do
    expect(response).to have_http_status :success
  end

end
