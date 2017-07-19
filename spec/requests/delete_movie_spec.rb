require 'rails_helper'
describe "delete movie route", :type => :request do

  before do
    movie = FactoryGirl.create(:movie)
    delete "/movies/#{movie.id}"
  end

  it 'destroys movie' do
    expect(response).to have_http_status 200
  end
end
