FactoryGirl.define do
  factory :api_key do
    access_token "MyString"
    user_id "MyString"
  end
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
