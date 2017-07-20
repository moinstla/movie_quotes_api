require 'rails_helper'

describe "get all movies route", :type => :request do
  let!(:movies) { FactoryGirl.create_list(:movie, 21)}


  before do
    token = FactoryGirl.create(:api_key)
    get "/movies?access_token=#{token.access_token}"
  end

  it 'returns all movies' do
    expect(JSON.parse(response.body).size).to eq 5
  end

  it 'returns status code 200' do
    expect(response).to have_http_status :success
  end
end
