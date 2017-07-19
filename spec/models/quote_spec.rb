require 'rails_helper'

describe Quote do
  it { should belong_to :movie }
  it { should validate_presence_of :character }
  it { should validate_presence_of :content }
end
