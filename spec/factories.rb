FactoryGirl.define do
  factory :movie do
    title 'title'
    genre 'genre'
  end

  factory :quote do
    character 'character'
    content 'content'
    movie_id 1
  end
end
