class Movie < ApplicationRecord
  has_many :quotes, dependent: :destroy
  validates :title, presence: true
  validates :genre, presence: true

  scope :title_search, -> (input) {where("title like ?", "%#{input}")}
  scope :most_quotes, -> {(
  select("movies.id, movies.title, count(quotes.id) as quotes_count")
  .joins(:quotes)
  .group("movies.id")
  .order("quotes_count DESC")
  .limit(1)
  )}
end
