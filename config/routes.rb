Dutchauction::Application.routes.draw do

  resource  :user do
    resources :purchases, only: []
  end

  resource  :session, only: [:new, :create, :destroy]
  resources :auctions, only: [:index, :show] do
    resource  :purchase, only: [:new, :create, :show]
    resource  :auction_participation, only: [:create]
  end

  namespace :administration do
    resources :users
    resources :auctions
    resources :purchases
  end

  root to: "auctions#index"
end