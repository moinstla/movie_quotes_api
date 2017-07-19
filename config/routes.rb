Rails.application.routes.draw do
  root to: 'movies#index'
  resources :movies do
    collection do
      get :most_quotes
    end
    resources :quotes
  end
end
