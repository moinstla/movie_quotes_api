require 'rails_helper'

context "get movie by most quotes route" do

  before do
    movie = Movie.create(title: 'test', genre: 'genre', id: 1)
    quote = FactoryGirl.create(:quote)
    get "/movies/most_quotes"
  end

  it "when movie with most quotes queried" do
    expect(Movie.first.title).to eq "test"
  end

  it 'returns status code success' do
    expect(response).to have_http_status 200
  end
end
