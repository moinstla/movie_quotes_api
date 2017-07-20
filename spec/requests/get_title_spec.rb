require 'rails_helper'

describe "get movie by title route" do

  before do
    token = FactoryGirl.create(:api_key)
    movie = FactoryGirl.create(:movie)
    get "/movies?title=title&access_token=#{token.access_token}"
  end

  it "returns movie by title" do
    expect(Movie.first.title).to eq "title"
  end

  it 'returns status code success' do
    expect(response).to have_http_status 200
  end
end
