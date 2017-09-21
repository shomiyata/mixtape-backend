Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'login', to: 'login#create'
      get 'user/create', to: 'users#create'
      get 'user/:id/mixtapes/new', to: 'mixtapes#new'
    end
  end
end

# :mixtape_grams
# resources :mixtapes
# resources :users, only: [:show, :update, :create] do
