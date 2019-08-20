Rails.application.routes.draw do
  devise_for :users

  resources :skis, only: [:index, :create, :show, :new] do
    resources :transactions, only: [:new, :create, :show]

    root to: 'skis#search'
  end
end
