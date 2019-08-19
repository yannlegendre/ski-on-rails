Rails.application.routes.draw do
  devise_for :users

  resources :skis, only: [:index, :create, :show]

  root to: 'skis#search'

end
