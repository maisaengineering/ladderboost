Ladderboost::Application.routes.draw do

  resources :messages_comments


  resources :messages


  resources :organization_profiles


  authenticated :user do
    root :to => 'devise/sessions#new'
  end
  devise_scope :user do
    root to: "devise/sessions#new"
  end


  #root :to => "home#index"

  devise_for :users ,controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  devise_scope :user do
    # match "/login" => "devise/sessions#new"
    # delete "/logout" => "devise/sessions#destroy"
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
    post 'users/auth/register'=>'users/omniauth_callbacks#create'
  end

  resources :users  do
    collection do

      post 'follow'
      post 'unfollow'
    end
    resource :profile  do
      collection do
        get 'path'
      end
    end
    resources :educations  , controller: 'users/educations'
    resources :professional_industries  , controller: 'users/professional_industries'
  end

  match "/my_account" => "users#show",as: :my_account
  match "/public_profile" => "users#public_profile",as: :public_profile

end