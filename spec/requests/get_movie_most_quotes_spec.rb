require 'rails_helper'

describe "get movie by most quotes route" do

  before do
    movie = Movie.create(title: 'test', genre: 'genre', id: 1)
    quote = FactoryGirl.create(:quote)
    get "/movies/most_quotes"
  end

  it "returns movie with the most quotes" do
    expect(Movie.first.title).to eq "test"
  end

  it 'returns status code success' do
    expect(response).to have_http_status 200
  end
end
