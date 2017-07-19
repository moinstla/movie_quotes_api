require 'rails_helper'

describe 'get exception route', type: :request do

  before do
    movie = FactoryGirl.create(:movie)
    get "/movies/7"
  end

  it 'returns error message' do
    expect(JSON.parse(response.body)['message']).to eq "Couldn't find Movie with 'id'=7"
  end
end
