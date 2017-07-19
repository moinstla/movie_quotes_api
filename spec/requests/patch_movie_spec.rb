require 'rails_helper'

describe "patch movies route", type: :request do
  before do
    movie = FactoryGirl.create(:movie)
    put "/movies/#{movie.id}", params: {
      :title => "new title",
      :genre => "genre"
    }
  end

  it 'updates movie' do
    expect(JSON.parse(response.body)['message']).to eq "Entry has been updated."
  end

  it 'should return status 200' do
         expect(response.status).to eq 200
     end


  it do
    expect(Movie.first.title).to eq "new title"
  end

end
