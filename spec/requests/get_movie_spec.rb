require 'rails_helper'

describe "get movie path" do

  before do
    movie = FactoryGirl.create(:movie)
    get "/movies/#{movie.id}"
  end

  it 'returns a movie' do
    expect(JSON.parse(response.body).size).to eq 6
  end

  it 'returns status code 200' do
    expect(response).to have_http_status :success
  end

end
