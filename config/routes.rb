Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'login', to: 'auth#login'
      get 'permission', to: 'permission#new'
      post 'permission', to: 'permission#create'
      post 'users/create', to: 'users#create'
      get 'verify', to: 'auth#verify'
      get 'users/:id/mixtapes', to: 'mixtapes#index'
      get 'users/:id/mixtapes/new', to: 'mixtapes#new'
      post 'users/:id/mixtapes/new', to: 'mixtapes#create'
      get 'mixtapes/:url', to: 'mixtapes#show'
      get 'mixtapes/:id/tracks/', to: 'tracks#index'
      post 'mixtapes/:id/tracks', to: 'tracks#add'
      post 'mixtapes/build', to: 'mixtapes#build'
    end
  end
end

# :mixtape_grams
# resources :mixtapes
# resources :users, only: [:show, :update, :create] do
