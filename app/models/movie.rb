class Movie < ApplicationRecord
  has_many :quotes, dependent: :destroy
  validates :title, presence: true
  validates :genre, presence: true
end
