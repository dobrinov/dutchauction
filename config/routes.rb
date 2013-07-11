Dutchauction::Application.routes.draw do

  resource  :user do
    resources :purchases, only: []
  end

  resource  :session, only: [:new, :create, :destroy]
  resources :auctions, only: [:index, :show] do
    resource  :purchase, only: [:new, :create, :show] do
      put :reserve
    end
    resource  :auction_participation, only: [:create]
  end

  namespace :administration do
    resources :users

    resources :auctions do
      put :schedule
      put :start
      put :stop
      put :pause
      put :finish
    end

    resources :purchases
  end

  root to: "auctions#index"
end