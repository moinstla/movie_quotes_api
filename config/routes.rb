Rails.application.routes.draw do

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :movies, concerns: :paginatable do
    collection do
      get :most_quotes
    end
    resources :quotes
  end
end
