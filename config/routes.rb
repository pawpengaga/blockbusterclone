Rails.application.routes.draw do
  resources :movies do
    get 'search'
  end
  resources :customers

  root 'movies#index'
end
