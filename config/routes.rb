Ladderboost::Application.routes.draw do

  authenticated :user do
    root :to => 'home#index'
  end

  root :to => "home#index"

  devise_for :users

  resources :users do
    resource :profile
  end

  match "/my_account" => "users#show",:as=>:my_account

end