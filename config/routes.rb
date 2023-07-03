Rails.application.routes.draw do
  resources :movies do
    get 'search'
  end
  resources :clients

  root 'movies#index'
end
