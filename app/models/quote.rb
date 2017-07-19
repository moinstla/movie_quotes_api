class Quote < ApplicationRecord
  belongs_to :movie
  validates :character, presence: true
  validates :content, presence: true
end
