Rails.application.routes.draw do
  get 'requests/new'
  get 'requests/create'
  get 'requests/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :events do
    resources :requests, only: [:new, :create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
