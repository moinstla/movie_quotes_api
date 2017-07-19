require 'rails_helper'

describe Quote do
  it { should belong_to :movie }
end
