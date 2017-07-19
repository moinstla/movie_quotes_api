require 'rails_helper'

describe "post a movie route", :type => :request do

  before do
    post '/movies', params: { :title => 'test_title', :genre => 'test_genre' }
  end

  it 'returns the title name' do
    expect(JSON.parse(response.body)['title']).to eq('test_title')
  end

  it 'returns the movie genre' do
    expect(JSON.parse(response.body)['genre']).to eq('test_genre')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:accepted)
  end
end
