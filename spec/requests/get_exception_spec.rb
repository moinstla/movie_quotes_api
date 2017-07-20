require 'rails_helper'

describe 'get exception route', type: :request do

  before do
    token = FactoryGirl.create(:api_key)
    movie = FactoryGirl.create(:movie)
    get "/movies/7?access_token=#{token.access_token}"
  end

  it 'returns error message' do
    expect(JSON.parse(response.body)['message']).to eq "Couldn't find Movie with 'id'=7"
  end
end
