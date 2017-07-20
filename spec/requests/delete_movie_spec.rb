require 'rails_helper'
describe "delete movie route", :type => :request do

  before do
    token = FactoryGirl.create(:api_key)
    movie = FactoryGirl.create(:movie)
    delete "/movies/#{movie.id}?access_token=#{token.access_token}"
  end

  it 'destroys movie' do
    expect(response).to have_http_status 200
  end
end
