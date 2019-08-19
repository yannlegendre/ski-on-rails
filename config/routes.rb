Rails.application.routes.draw do
  devise_for :users

  resources :skis, only: [:index, :create, :show, :new]

  root to: 'skis#search'

end
