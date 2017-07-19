require 'rails_helper'

describe "get all movies route", :type => :request do
  let!(:movies) { FactoryGirl.create_list(:movie, 21)}

  before { get '/movies' }

  it 'returns all movies' do
    expect(JSON.parse(response.body).size).to eq 21
  end

  it 'returns status code 200' do
    expect(response).to have_http_status :success
  end
end
