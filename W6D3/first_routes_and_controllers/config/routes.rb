Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    resources :artworks, only: [:index]
  end

  resources :users, only: [:index,:create, :destroy, :update]


  # get 'users/:id', to: 'users#show', as: 'user'
  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # get '/users/:id/edit', to: 'users#edit'
  # get '/users/new', to: 'users#new'
  # post '/users', to: 'users#create'
  # put '/users', to: 'users#create'
  # patch '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'


end
