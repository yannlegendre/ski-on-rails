Rails.application.routes.draw do
  devise_for :users

  resources :skis, only: [:index, :create, :show, :newx²]

  root to: 'skis#search'

end
