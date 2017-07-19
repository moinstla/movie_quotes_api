require 'rails_helper'

describe Movie do
  it { should have_many :quotes }
end
