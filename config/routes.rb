Rails.application.routes.draw do
  devise_for :users
  root to: 'skis#search'

  resources :skis, only: [:index, :create, :show, :new] do
  resources :transactions, only: [:new, :create]
    end
  resources :transactions, only: [:show]
end
