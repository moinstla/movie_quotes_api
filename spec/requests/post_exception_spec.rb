require 'rails_helper'

describe "post exception route", :type => :request do

  before do
    post '/movies', params: { title: '', genre: 'genre'}
  end

  it 'returns error message' do
    expect(JSON.parse(response.body)['message']).to eq "Validation failed: Title can't be blank"
  end

  it 'returns unprocessabel entity status' do
    expect(response).to have_http_status 422
  end
end
