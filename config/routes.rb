Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'login', to: 'auth#create'
      post 'users/create', to: 'users#create'
      post 'users/verify', to: 'users#verify'

      # FIX THIS BELOW, NEST CORRECTLY!
      get 'users/:id/mixtapes', to: 'mixtapes#index'
      get 'users/:id/mixtapes/new', to: 'mixtapes#new'
    end
  end
end

# :mixtape_grams
# resources :mixtapes
# resources :users, only: [:show, :update, :create] do
