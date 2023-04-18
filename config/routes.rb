Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :accounts, only: [:index, :create, :destroy]
      resources :balances, only: [:index, :create, :destroy]
    end
  end
  root 'dashboard#index'
end
