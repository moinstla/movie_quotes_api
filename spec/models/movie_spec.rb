require 'rails_helper'

describe Movie do
  it { should have_many :quotes }
  it { should validate_presence_of :title }
  it { should validate_presence_of :genre }
end
