Dutchauction::Application.routes.draw do

  namespace :administration do
    resources :users
    resources :auctions
    resources :purchases
  end

end