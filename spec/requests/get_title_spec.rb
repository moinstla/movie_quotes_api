require 'rails_helper'

describe "get movie by title route" do

  before do
    movie = FactoryGirl.create(:movie)
    get "/movies?title=title"
  end

  it "returns movie by title" do
    expect(Movie.first.title).to eq "title"
  end

  it 'returns status code success' do
    expect(response).to have_http_status 200
  end
end
