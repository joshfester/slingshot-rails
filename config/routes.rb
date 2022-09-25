# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  
  namespace :admin do
      resources :users

      root to: "users#index"
    end

  root to: 'pages#home'

  get '/health', to: proc { [200, {}, ['success']] }

  devise_for :users

  resources :users, only: [ :update, :index ]

  get 'profile', to: 'users#show'
  
end
