Rails.application.routes.draw do
  get 'users/index'
  # Deleted extra routes automatically generated by Rails
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  resources :users, only: [:show]
  resources :events do
    resources :requests, only: [:new, :create]
  end

  # According to Alexander, destroy action of requests should not be nested into events
  resources :requests, only: :destroy do
    member do
      get "confirmation"
      # root for the request confirmation page
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
